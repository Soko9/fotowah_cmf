class AppFailure {
  const AppFailure({this.message = 'Unknown Error', this.stackTrace});
  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => '$message\n\n$stackTrace';
}
