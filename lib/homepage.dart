import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  Scaffold(
      body: Center(child: Column(children: [
        SizedBox(height: mediaQuery.size.height * 0.15),
        const Text(
          'Bem Vindo(a)!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: mediaQuery.size.height * 0.1),
        ElevatedButton(onPressed: () {
          //Abrir página de matérias
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