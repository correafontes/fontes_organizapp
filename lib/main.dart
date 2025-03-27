import 'package:flutter/material.dart';
import 'package:fontes_organizapp/createpage.dart';
import 'package:fontes_organizapp/homepage.dart';
import 'package:fontes_organizapp/createsubjects.dart';
import 'initializepage.dart';
import 'package:sqlite3/sqlite3.dart' as prefix;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



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
        '/home': (context) => HomePage(),
        '/createsubjects': (context) => CreateSubjects(Database as Database),
      },
    );
  }
}

