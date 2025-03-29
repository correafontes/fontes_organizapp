import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Initializepage extends StatefulWidget {
  const Initializepage({super.key});

  @override
  State<Initializepage> createState() => _InitializepageState();
}

class _InitializepageState extends State<Initializepage> {
  @override
  Widget build(BuildContext context) {
    // Obtendo o tamanho da tela (Tamanhos Relativos)
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
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
          Navigator.pushNamed(context, '/create');
        }, child: Text('Criar Arquivo'),),
        SizedBox(height: mediaQuery.size.height * 0.075),
        Divider(),
        SizedBox(height: mediaQuery.size.height * 0.075),
        ElevatedButton(onPressed: () {
          
        }, child: Text('Abrir Existente'),),
      ],),),
      bottomNavigationBar: BottomAppBar(
        height: mediaQuery.size.height * 0.095,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Desenvolvido por: '),
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/correafontes'));
              },
              child: Text('Davi Fontes')
            )
          ],
        ),
      ),
    );
  }
}