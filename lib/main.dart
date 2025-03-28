import 'package:flutter/material.dart';
import 'package:fontes_organizapp/createpage.dart';
import 'package:fontes_organizapp/homepage.dart';
import 'package:fontes_organizapp/createsubjects.dart';
import 'initializepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrganizApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => Initializepage(),
        '/create': (context) => CreatePage(),
        '/home': (context) => HomePage(pathdb: ModalRoute.of(context)!.settings.arguments as String),
        '/createsubjects': (context) => CreateSubjects(''),
      },
    );
  }
}

