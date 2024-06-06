import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure (super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
              return ServerFailure('تم إلغاء طلب خادم API');

      case DioExceptionType.connectionTimeout:
        return ServerFailure('مهلة الاتصال مع Api');

      case DioExceptionType.sendTimeout:
        return ServerFailure('أرسل مهلة مع Apiserver');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('احصل على مهلة مع Apiserver');

      case DioExceptionType.badCertificate:

      case DioExceptionType.badResponse:

      case DioExceptionType.connectionError:
      return ServerFailure.fromDioError(dioError);

      //       case DioExceptionType.response:
      //   return ServerFailure.fromResponse(
      //       dioError.response!.statusCode, dioError.response!.data);
      // case DioExceptionType.cancel:
      //   return ServerFailure('Request to ApiServer was canceld');


      // ignore: unreachable_switch_case
      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء طلب خادم API');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('لا اتصال إنترنت');
        }
        return ServerFailure('خطأ غير متوقع ، يرجى المحاولة مرة أخرى!');
      default:
        return ServerFailure('OPPS كان هناك خطأ ، يرجى المحاولة مرة أخرى'); 
    }
    // throw UnimplementedError();
  
  }
  
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode != null && response != null) {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(response['error']['message']);
      } else if (statusCode == 404) {
        return ServerFailure('طلبك لم يتم العثور عليه ، يرجى المحاولة لاحقًا!');
      } else if (statusCode == 500) {
        return ServerFailure('خطأ خادم داخلي ، يرجى المحاولة لاحقًا');
      }
    }
    return ServerFailure('OPPS كان هناك خطأ ، يرجى المحاولة مرة أخرى');
  }
}
                 

 
