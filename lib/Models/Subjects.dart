import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modalbottom;
class Subject {
  // Identificador único da matéria
  int id;

  // Nome da matéria
  String name;

  // Quantidade de horas associadas à matéria
  int hours;

  // Construtor da classe Subject, que exige os campos id, name e hours
  Subject({required this.id, required this.name, required this.hours});

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as int,
      name: map['name'] as String,
      hours: map['hours'] as int,
    );
  }
  // Método widget builder para exibir a matéria em um Card recebendo uma lista de Materias
  List<Widget> buildSubjectCard(BuildContext context, List<Subject> subjects) {
    return subjects.map((subject) {
      return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Card(
        child: ListTile(
          leading: Text('${subject.id}'),
          title: Text(subject.name),
          subtitle: Text('Horas: ${subject.hours}'),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Lógica para editar
            },
          ),
          onLongPress: () {
            // Lógica para excluir
            modalbottom.showMaterialModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Deseja excluir a matéria?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para confirmar exclusão
                            Navigator.of(context).pop();
                          },
                          child: Text('Sim'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Não'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),);
    }).toList();
  }
}