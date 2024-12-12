sealed class Result<Exception, T> {
  const Result();
}

final class Success<T> extends Result<Exception, T> {
  final T value;
  const Success(this.value);
}

final class Failure<T> extends Result<Exception, T> {
  final Exception exception;
  const Failure(this.exception);
}

final class Loading<T> extends Result<Exception, T> {
  const Loading();
}

final class Idle<T> extends Result<Exception, T> {
  const Idle();
}
