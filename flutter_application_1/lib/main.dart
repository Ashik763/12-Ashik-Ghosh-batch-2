import 'package:flutter/material.dart';
import 'package:flutter_application_1/Register_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/one.dart';
// import 'package:flutter_application_1/Register_page.dart';
// import 'register_page.dart';
// import 'login_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RegisterPage()
      // home:  ProductSpecification()
      // home:  LoginPage()
      //sRegisterPage(),
      
   
);
}
}