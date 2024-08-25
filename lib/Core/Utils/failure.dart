import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioExcption(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Opps Connection is timeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Opps Sending is timeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Opps receive is timeOut");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Opps bad certificate in server");
      case DioExceptionType.badResponse:
        ServerFailure.formBadResponse(
            statusCode: dioError.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Opps Connection is canceld");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Opps Connection Error, try later");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "Opps there is was an error, try later");
      default:
        ServerFailure(errorMessage: "Opps ther was unKnown error");
    }
    return ServerFailure(errorMessage: "Opps ther was unKnown error");
  }

  factory ServerFailure.formBadResponse({required int? statusCode}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          errorMessage: "Opps Your Request Not Found, try later");
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: "Opps Error in Server");
    } else {
      return ServerFailure(errorMessage: "Opps ther was unKnown error");
    }
  }
}
