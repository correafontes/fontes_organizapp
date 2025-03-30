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
}