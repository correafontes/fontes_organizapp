import 'package:flutter/material.dart';
import 'package:fontes_organizapp/createsubjects.dart';
import 'package:sqflite/sqflite.dart';


class HomePage extends StatefulWidget {
  
  final String pathdb;
  const HomePage({super.key, required this.pathdb});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String path='';
  @override
  void initState() {
    super.initState();
    path = widget.pathdb;
  }
  
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  Scaffold(
      body: Center(child: Column(children: [
        SizedBox(height: mediaQuery.size.height * 0.15),
        Text('Caminho do banco de dados: $path'),
        const Text(
          'Bem Vindo(a)!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: mediaQuery.size.height * 0.1),
        ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, '/createSubjects',arguments: dbpath);
        }, child: Text('Matérias'),),
        SizedBox(height: mediaQuery.size.height * 0.075),
        Divider(),
        SizedBox(height: mediaQuery.size.height * 0.075),
        ElevatedButton(onPressed: () {
          //Abrir página de faltas
        }, child: Text('Faltas'),),
      ],),),
      bottomNavigationBar: BottomAppBar(
        height: mediaQuery.size.height * 0.095,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Desenvolvido por: '),
            TextButton(
              onPressed: () {
                //Abrir site
              },
              child: Text('Davi Fontes')
            )
          ],
        ),
      ),
    );
  }
}