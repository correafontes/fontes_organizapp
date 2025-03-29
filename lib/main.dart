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
        // Página inicial
        '/': (context) => Initializepage(),
        // Página de criação de banco de dados
        '/create': (context) => CreatePage(),
        // Página Principal/Home (Argumento: caminho do banco de dados)
        '/home': (context) => HomePage(pathdb: ModalRoute.of(context)!.settings.arguments as String),
        // Página de criação de matérias (Argumento: caminho do banco de dados)
        '/createSubjects': (context) => CreateSubjects(dbpath: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}

