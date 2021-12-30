import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:textfieldtask/text_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        primarySwatch: Colors.blue,
      ),
      home:  TextForm(),
    );
  }
}

