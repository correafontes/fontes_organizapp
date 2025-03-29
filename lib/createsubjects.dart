import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart' as prefix;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


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
    dbpath= widget.dbpath; // Assign the passed value to the local variable
    print('Caminho do banco de dados: $dbpath'); // Debug print to verify the value
    super.initState();
  }

  Future <int> addSubject(String name, int hours) async {
    try {
      final db = prefix.sqlite3.open(dbpath); 
      db.execute('''
        INSERT INTO subject (name, hours)
        VALUES (?, ?)
      ''', [name, hours]);
      print("Matéria adicionada com sucesso!");
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
              onPressed: () {
                addSubject(_nameController.text, int.parse(_hoursController.text));
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}