import 'package:tdd_tutorial/data/network/base_api_services.dart';
import 'package:tdd_tutorial/data/network/network_api_service.dart';
import 'package:tdd_tutorial/res/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices=NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response= await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}