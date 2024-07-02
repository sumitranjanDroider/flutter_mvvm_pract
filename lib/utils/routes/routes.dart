import 'package:flutter/material.dart';
import 'package:tdd_tutorial/utils/routes/routes_name.dart';
import 'package:tdd_tutorial/view/home_screen.dart';
import 'package:tdd_tutorial/view/login_view.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Route defined'),
            ),
          );
        });
    }
  }
}