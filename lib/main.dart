import 'package:flutter/material.dart';
import 'package:light/home.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 56, 37, 180)),
        primaryColor: Colors.deepPurple,
      ),
      home: const Home(),
    );
  }
}
