abstract class AppEither<L, R> {
  const AppEither();

  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight);

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;
}

class Left<L, R> extends AppEither<L, R> {
  const Left(this.value);
  final L value;

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) => onLeft(value);

  @override
  String toString() => 'Left($value)';
}

class Right<L, R> extends AppEither<L, R> {
  const Right(this.value);
  final R value;

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) => onRight(value);

  @override
  String toString() => 'Right($value)';
}
