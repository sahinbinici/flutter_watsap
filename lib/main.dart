import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watsapp/landing_page.dart';
import 'package:watsapp/locator.dart';
import 'package:watsapp/view_models/user_model.dart';

void main() {
 setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter WatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: ChangeNotifierProvider(
          create: (context)=>UserModel(),
          child: LandingPage())
    );
  }
}

