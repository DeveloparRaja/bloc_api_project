import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio = Dio();
  
  Future<List<dynamic>> apiFetchUsers() async{
    try{
      Response response = await _dio.get("https://fakestoreapi.com/products/");
      return response.data;
    }
    catch(e){
      throw Exception('Failed to load users: $e');
    }
  }
}