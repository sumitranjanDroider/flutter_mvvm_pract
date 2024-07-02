

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tdd_tutorial/repository/auth_repository.dart';
import 'package:tdd_tutorial/utils/routes/routes_name.dart';
import 'package:tdd_tutorial/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
final _myRepo =AuthRepository();
bool _loading=false;
bool get loading=> _loading;

setLoading(bool value){
  _loading=value;
  notifyListeners();
}
Future<void> loginApi(dynamic data,BuildContext context) async{
  setLoading(true);
  _myRepo.loginApi(data).then((value){
    Utils.flushBarErrorMessages('Login Successful', context);
    setLoading(false);
    Navigator.pushNamed(context, RoutesName.home);
    if (kDebugMode) {
      print(value.toString());
    }
  }).onError((error,stackTrace){
    setLoading(false);
    if (kDebugMode) {
      Utils.flushBarErrorMessages(error.toString(), context);
      print(error.toString());
    }
  });

}
}