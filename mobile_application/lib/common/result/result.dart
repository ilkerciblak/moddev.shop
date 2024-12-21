// ignore_for_file: unused_local_variable

sealed class Result<ExceptionT, T> {
  const Result();

  factory Result.ok(T value) => SuccessResult(value);
  factory Result.error(ExceptionT exception) => FailureResult(exception);

  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isIdle => this is Idle;

  void match({
    required void Function(T r) onSuccess,
    required void Function(Exception l) onFailure,
    void Function()? onLoading,
    void Function()? onIdle,
  }) {
    switch (this) {
      case Success success:
        onSuccess.call(success.value);
      case Failure failure:
        onFailure.call(failure.exception);
      default:
        onLoading?.call();
    }
  }
}

final class SuccessResult<Exception, T> extends Result<Exception, T> {
  final T? value;
  const SuccessResult([this.value]);
}

final class FailureResult<Exception, T> extends Result<Exception, T> {
  final Exception exception;
  const FailureResult(this.exception);
}

final class Loading<T> extends Result<Exception, T> {
  const Loading();
}

final class Idle<T> extends Result<Exception, T> {
  const Idle();
}

extension ISREAL on ActionResult {
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
}

typedef Success<T> = SuccessResult<Exception, T>;
typedef Failure<T> = FailureResult<Exception, T>;
typedef ActionResult<T> = Result<Exception, T>;
