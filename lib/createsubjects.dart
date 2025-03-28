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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(dbpath),
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
                
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}