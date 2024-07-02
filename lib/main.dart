import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_tutorial/utils/routes/routes.dart';
import 'package:tdd_tutorial/utils/routes/routes_name.dart';
import 'package:tdd_tutorial/view/login_view.dart';
import 'package:tdd_tutorial/viewmodel/auth_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) =>AuthViewModel())
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

