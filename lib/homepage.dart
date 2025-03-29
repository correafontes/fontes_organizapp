import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  final String pathdb;

  const HomePage({super.key, required this.pathdb});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String path;

  Future <bool> showSubjects() async{
    try{
      final db = sqlite.sqlite3.open(path); 
      final result = db.select('SELECT * FROM subject');
      print("Matérias: $result");
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    // Atribuindo o caminho do banco de dados passado como argumento para a variável local
    path = widget.pathdb;
    print('Caminho do banco de dados: $path'); 
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
                
              },
              child: const Text('Faltas'),
            ),
            ElevatedButton(onPressed: () {
              showSubjects();
            }, child: const Text('Mostrar'),),
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
                launchUrl(Uri.parse('https://github.com/correafontes'));
              },
              child: const Text('Davi Fontes'),
            ),
          ],
        ),
      ),
    );
  }
}