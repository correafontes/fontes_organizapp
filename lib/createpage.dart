import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController _controller = TextEditingController();
  String _nome = '';

  Future<int> initializeDB(String nomedb) async {
  String path = await getDatabasesPath();
  try{
    openDatabase(
    join(path, 'example.db'),
    onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE materias(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, carga INTEGER NOT NULL)"
      );
      await database.execute(
        "CREATE TABLE faltas(id INTEGER PRIMARY KEY AUTOINCREMENT, id_materia INTEGER NOT NULL, data TEXT NOT NULL, FOREIGN KEY(id_materia) REFERENCES materias(id))"
      );
      database.close();
    },
    version: 1,
  );
  return 1;
  }catch(e){
    print(e);
  }
  return 0;
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Criar Base de Dados',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nome da Base de Dados',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _nome=_controller.text;
                if(initializeDB(_nome)==1){
                  Navigator.pushNamed(context, '/home');
                }
                
              },
              child: Text('Criar!'),
            ),
          ],
        ),
      ),
    );
  }
}