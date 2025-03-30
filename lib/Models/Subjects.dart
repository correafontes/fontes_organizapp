import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqlite3/sqlite3.dart';
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
  List<Widget> buildSubjectCard(List<Subject> subjects) {
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
            // Lógica para excluir matéria
          },
        ),
      ),);
    }).toList();
  }
}