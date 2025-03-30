import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:url_launcher/url_launcher.dart';
import 'Models/Subjects.dart';


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
    // Atribuindo o caminho do banco de dados passado como argumento para a variável local
    path = widget.pathdb;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    int _selectedIndex=0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: mediaQuery.size.height * 0.25),
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
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Faltas'),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/subjects', arguments: path);
            }, child: const Text('Mostrar'),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Matérias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.warning_amber_rounded),
          label: 'Faltas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        switch(index){
          case 0:
          case 1:
          Navigator.pushNamed(context, '/subjects', arguments: path);
          case 2:
            Navigator.pushNamed(context, '/createSubjects', arguments: path);
          case 3:
          default: break;


        }

      },
      backgroundColor: Colors.blueGrey,
      ),
      
    );
  }
}