import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_tutorial/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Center(
       child: InkWell(
         onTap: (){
           Utils.snackBar("No internet", context);
          // Utils.flushBarErrorMessages('No internet connection', context);
        //   Utils.toastMessages('No Internet connection');
         },
         child: Text('Click'),
       ),
     ),
    );
  }
}
