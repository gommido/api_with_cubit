import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProductsWebService
{


  late Dio dio;

  ProductsWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getProducts() async{
    try{
      Response response = await dio.get(
          'products',
      );
      return response.data['products'];
    } catch(e){
      return [];
    }
  }



}