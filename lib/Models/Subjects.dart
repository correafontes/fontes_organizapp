import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modalbottom;
import 'package:fluttertoast/fluttertoast.dart';
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
    // Método para excluir uma matéria do banco de dados
    // Recebe o ID da matéria a ser excluída e o caminho do banco de dados
    Future<bool> deleteSubject(int id,String path) async {
      try{
        final db = sqlite.sqlite3.open(path);
        // Executa a instrução SQL para excluir a matéria com o ID fornecido
        db.execute('DELETE FROM subject WHERE id = ?', [id]);
        Fluttertoast.showToast(
          msg: 'Matéria excluída com sucesso!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
        );
        db.dispose();
      }
      catch(e){
        // Se ocorrer um erro, exibe uma mensagem de erro
        Fluttertoast.showToast(
          msg: 'Erro ao excluir a matéria: $e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );
        return false;
      }
      finally{
        // Fechar a conexão com o banco de dados
        
      }
      return true;
    }
    Future<bool> updateSubject(int id, String name, int hours,String path) async {
      try{
        final db = sqlite.sqlite3.open(path);
        // Executa a instrução SQL para atualizar a matéria com o ID fornecido
        db.execute('UPDATE subject SET name = ?, hours = ? WHERE id = ?', [name, hours, id]);
        Fluttertoast.showToast(
          msg: 'Matéria atualizada com sucesso!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
        );
        db.dispose();
      }
      catch(e){
        // Se ocorrer um erro, exibe uma mensagem de erro
        Fluttertoast.showToast(
          msg: 'Erro ao atualizar a matéria: $e',
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

  // Método widget builder para exibir a matéria em um Card recebendo uma lista de Materias
  List<Widget> buildSubjectCard(BuildContext context, List<Subject> subjects,String path) {
    return subjects.map((subject) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
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
                                  deleteSubject(subject.id, path);
                                  //atualiza a lista de matérias
                                  subjects.remove(subject);
                                  //atualiza a tela
                                  // Fecha o modal
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
                  setState(() {
                    // Atualiza o estado se necessário
                  });
                },
              ),
            ),
          );
        },
      );
    }).toList();
    
  }
}