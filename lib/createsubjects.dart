import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CreateSubjects extends StatefulWidget {

  final String dbpath;
  const CreateSubjects({super.key, required this.dbpath});

  @override
  State<CreateSubjects> createState() => _CreatesubjectsState();
}

class _CreatesubjectsState extends State<CreateSubjects> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _hoursController = TextEditingController();
  late String dbpath;
  
  @override
  void initState() {
    // Atribuindo o caminho do banco de dados passado como argumento para a variável local
    dbpath= widget.dbpath; 
    print('Caminho do banco de dados: $dbpath'); 
    super.initState();
  }

  Future <bool> addSubject(String name, int hours) async {
    try {
      final db = sqlite.sqlite3.open(dbpath); 
      print("Caminho do banco de dadihos: $name");
      print("Adicionando matéria: $name, Carga horária: $hours");
      db.execute('''
        INSERT INTO subject (name, hours)
        VALUES (?, ?)
      ''', [name, hours]);
      print("Matéria adicionada com sucesso!");
      db.dispose();
      
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Erro ao adicionar matéria AQui!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
      return false;
    }
    return true;
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
              'Criar Matérias',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome da matéria',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _hoursController,
              decoration: InputDecoration(
                labelText: 'Carga horária',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:  () async{
                bool resultado = await(addSubject(_nameController.text, int.parse(_hoursController.text)));
                if(resultado){
                  Fluttertoast.showToast(
                    msg: "Matéria adicionada com sucesso!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                  Navigator.pop(context);
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Erro ao adicionar matéria!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}