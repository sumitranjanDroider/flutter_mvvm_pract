import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_tutorial/res/colors.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButtons({super.key,required this.title,this.loading=false,required this.onPress });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(10)),
        child: Center(
          child:loading ? CircularProgressIndicator() : Text('$title',style: TextStyle(color:AppColors.whiteColor),),),
      ),
    );
  }
}
