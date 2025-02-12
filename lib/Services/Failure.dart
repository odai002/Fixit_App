abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure implements Failure {
  @override
  String get message => "Connection error";
}

class InternetFailure implements Failure {
  @override
  String get message => "No internet connection";
}

class GlobalFailure implements Failure {
  @override
  String get message => "An unexpected error occurred, please try again";
}

class ResultFailure implements Failure {
  @override
  final String message;

  ResultFailure(this.message);

  @override
  String toString() => message;
}
