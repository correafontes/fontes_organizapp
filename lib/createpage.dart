import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController _controller = TextEditingController();
  String _nome = '';
  String path='';

  Future<int> initializeDB(String nomedb) async {
  nomedb='$nomedb.db';
  try{
   path = await getDatabasesPath();
  path = join(path, nomedb);
  final db = sqlite3.open(path); 

  //Toast de sucesso
  Fluttertoast.showToast(
    msg: "Banco de dados criado com sucesso!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0
  );
  //Criando tabelas
  db.execute('''
    CREATE TABLE subject(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      hours INTEGER
    )
  ''');
  db.execute('''
    CREATE TABLE absense(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_subject INTEGER,
      data TEXT
    )
  ''');
  } catch (e) {
    print(e);
    return 0;
  }
  return 1;
  
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
              onPressed: () async {
                _nome = _controller.text;
                int result = await initializeDB(_nome);
                if (result==1) {
                  Navigator.pushNamed(context, '/home', arguments: path);
                } else {
                    //Toast de erro
                    Fluttertoast.showToast(
                      msg: "Erro ao criar o banco de dados!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
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