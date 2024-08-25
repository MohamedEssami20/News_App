import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future< Map<String,dynamic>> get({required String endPoints}) async {
    String apiKey = "wLSs-AGYl2iUPgQewolcgKThu-cqGUBTE47KVXmv7sAzHTd9";
    String baseUrl = "https://api.currentsapi.services/v1/search?apiKey=$apiKey";
    Response response = await _dio.get("$baseUrl$endPoints");
    return response.data;
  }
}
