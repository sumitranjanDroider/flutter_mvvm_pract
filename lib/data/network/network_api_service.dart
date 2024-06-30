
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tdd_tutorial/data/app_exceptions.dart';
import 'package:tdd_tutorial/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     responseJson = returnResponse(response);
   }on SocketException {
     throw FetchDataException('No internet Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson =jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException('Response - ${response.body}   StatusCode-${response.statusCode}');
      case 500:
        throw FetchDataException('Response - ${response.body}   StatusCode-${response.statusCode}');

        default:
          throw FetchDataException('Error occured while communicating with server  With Status code ${response.statusCode}');
    }
  }
  
}