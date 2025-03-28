import 'package:flutter/material.dart';
import 'package:fontes_organizapp/createsubjects.dart';

class HomePage extends StatefulWidget {
  final String pathdb;

  const HomePage({super.key, required this.pathdb});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String path;

  @override
  void initState() {
    super.initState();
    path = widget.pathdb; // Assign the passed value to the local variable
    print('Caminho do banco de dados: $path'); // Debug print to verify the value
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: mediaQuery.size.height * 0.15),
            Text(
              'Caminho do banco de dados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              path,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediaQuery.size.height * 0.1),
            const Text(
              'Bem Vindo(a)!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.1),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createSubjects', arguments: path);
              },
              child: const Text('Matérias'),
            ),
            SizedBox(height: mediaQuery.size.height * 0.075),
            const Divider(),
            SizedBox(height: mediaQuery.size.height * 0.075),
            ElevatedButton(
              onPressed: () {
                // Add navigation to the "Faltas" page here
              },
              child: const Text('Faltas'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: mediaQuery.size.height * 0.095,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Desenvolvido por: '),
            TextButton(
              onPressed: () {
                // Add functionality to open the developer's website
              },
              child: const Text('Davi Fontes'),
            ),
          ],
        ),
      ),
    );
  }
}