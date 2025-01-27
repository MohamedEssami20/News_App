import 'package:dio/dio.dart';
import 'package:news_app/Core/Constant/backend_endpoint.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future< Map<String,dynamic>> get({required String endPoints}) async {
    String baseUrl = kbaseUrl;
    Response response = await _dio.get("$baseUrl$endPoints");
    return response.data;
  }
}
