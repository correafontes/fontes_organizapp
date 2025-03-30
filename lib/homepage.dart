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
  List<Subject> subjects = [];

  Future <List<Subject>> showSubjects() async{
    try{
      final db = sqlite.sqlite3.open(path); 
      final result = db.select('SELECT * FROM subject');
      print("Matérias: $result");
      subjects = result.map((result) => Subject.fromMap(result)).toList();
      print("Matérias: $subjects");
      db.dispose();

    } catch (e) {
      print(e);
      print("Erro ao abrir o banco de dados.");
      return [];
    }
    return subjects;
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
              showSubjects();
              setState(() {
                // Atualiza a tela após buscar as matérias
              });
            }, child: const Text('Mostrar'),),
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(subjects[index].name),
                  subtitle: Text('Horas: ${subjects[index].hours}'),
                );
              },
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