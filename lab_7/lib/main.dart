import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'screens/root_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => const RootScreen(),
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}