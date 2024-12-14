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

typedef ActionResult<T> = Result<Exception, T>;

extension ISREAL on ActionResult {
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
}
