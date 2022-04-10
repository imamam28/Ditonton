class ServerException implements Exception {
  final int responseCode;
  final String message;

  ServerException({required this.responseCode, required this.message});
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
