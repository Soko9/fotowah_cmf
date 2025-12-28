#include "flutter_window.h"

#include <optional>

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  // MY CHANGES BEGIN //
  HWND hwnd = GetHandle();

  LONG style = GetWindowLong(hwnd, GWL_STYLE);

  // Remove title bar
  style &= ~WS_CAPTION;

  // Disable resizing
  style &= ~WS_THICKFRAME;

  // Disable maximize button
  style &= ~WS_MAXIMIZEBOX;

  // Keep minimize button (do NOT remove WS_MINIMIZEBOX)

  SetWindowLong(hwnd, GWL_STYLE, style);

  // Apply style changes
  SetWindowPos(
      hwnd,
      nullptr,
      0, 0, 0, 0,
      SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER | SWP_FRAMECHANGED
  );
  // MY CHANGES END //

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());

  // MY CHANGES BEGIN //
  flutter::MethodChannel<> channel(
    flutter_controller_->engine()->messenger(),
    "window_controls",
    &flutter::StandardMethodCodec::GetInstance());

  channel.SetMethodCallHandler(
    [this](const flutter::MethodCall<>& call,
           std::unique_ptr<flutter::MethodResult<>> result) {
      HWND hwnd = GetHandle();

      if (call.method_name() == "minimize") {
        ShowWindow(hwnd, SW_MINIMIZE);
      } else if (call.method_name() == "close") {
        PostMessage(hwnd, WM_CLOSE, 0, 0);
      }

    result->Success();
  });

  // MY CHANGES END //

  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
    ShowWindow(GetHandle(), SW_MAXIMIZE);
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
