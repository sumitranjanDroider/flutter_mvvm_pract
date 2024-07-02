
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_tutorial/res/component/round_buttons.dart';
import 'package:tdd_tutorial/utils/utils.dart';
import 'package:tdd_tutorial/viewmodel/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword =ValueNotifier<bool>(true);
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  FocusNode emailFocusNode =FocusNode();
  FocusNode passwordFocusNode =FocusNode();

  @override
  void dispose() {

    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
     body: SafeArea(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           TextFormField(
             controller: _emailController,
             keyboardType: TextInputType.emailAddress,
             focusNode: emailFocusNode,
             decoration: InputDecoration(
               labelText: 'Email',
               hintText: 'Email',
               prefixIcon: Icon(Icons.email)
             ),
             onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
             },
           ),
           ValueListenableBuilder(
               valueListenable: _obsecurePassword, builder: (context,value,child){
                 return  TextFormField(
                   controller: _passwordController,
                   obscureText: _obsecurePassword.value,
                   obscuringCharacter: '*',
                   focusNode: passwordFocusNode,
                   decoration:  InputDecoration(
                     labelText: 'Password',
                     hintText: 'Password',
                     prefixIcon: Icon(Icons.password),
                     suffixIcon: InkWell(
                       onTap: (){
                         _obsecurePassword.value=!_obsecurePassword.value;
                       },
                        child: Icon(
                            _obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility),
                         ),
                   ),
                 );
           }),
           SizedBox(height: height*.1,),
           RoundButtons(
             title: 'Login',
             loading: authViewModel.loading,
             onPress: (){
               if(_emailController.text.isEmpty){
                 Utils.flushBarErrorMessages("Please enter email", context);
               }else if(_passwordController.text.isEmpty){
                 Utils.flushBarErrorMessages("Please enter password", context);
               }else if(_passwordController.text.length<6){
                 Utils.flushBarErrorMessages("Please enter 6 digit password", context);
               }else{
                 Map data={
                   'email':_emailController.text.toString(),
                   'password':_passwordController.text.toString(),
                 };
                 authViewModel.loginApi(data,context);
               }
             },
           ),

         ],
       ),
     ),
    );
  }
}
