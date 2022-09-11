import 'dart:convert';

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class SSLFailure extends Failure {
  const SSLFailure(String message) : super(message);
}

String errorMessage(String responseBody) {
  try {
    return jsonDecode(responseBody)['status_message'] ?? responseBody;
  } catch (e) {
    return responseBody;
  }
}
