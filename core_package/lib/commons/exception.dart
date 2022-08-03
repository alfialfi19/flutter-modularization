abstract class AppException implements Exception {
  final _error;
  final _prefix;

  AppException([this._error, this._prefix]);

  Map<String, dynamic>? toMap() {
    return {
      "error": "$_prefix$_error",
      "object": _error,
    };
  }
}

/// Default HTTP exception for undefined status error
class FetchDataException extends AppException {
  FetchDataException(error)
      : super(error, "[ERROR] Error During Communication: ");
}

/// HTTP exception for error status 400
class BadRequestException extends AppException {
  BadRequestException(error) : super(error, "[ERROR] Invalid Request: ");
}

/// HTTP exception for error status 401
class UnauthorizedException extends AppException {
  UnauthorizedException(error) : super(error, "[ERROR] Unauthorized: ");
}

/// HTTP exception for error status 403
class ForbiddenException extends AppException {
  ForbiddenException(error) : super(error, "[ERROR] Forbidden: ");
}

/// Exception for wrong input in forms
class InvalidInputException extends AppException {
  InvalidInputException(error) : super(error, "[ERROR] Invalid Input: ");
}

/// HTTP exception for error status 504 and request timeout
class TimeoutException extends AppException {
  TimeoutException(error) : super(error, "[ERROR] Connection Timeout: ");
}

/// HTTP exception for error status 503
class ServiceUnavailableException extends AppException {
  ServiceUnavailableException(error)
      : super(error, "[ERROR] Service Unavailable : ");
}

/// HTTP exception for error status 404 & 204
class NotFoundException extends AppException {
  NotFoundException(error) : super(error, "[ERROR] Not Found: ");
}

/// HTTP exception for error status 500
class InternalServerErrorException extends AppException {
  InternalServerErrorException(error)
      : super(error, "[ERROR] Internal Server Error: ");
}
