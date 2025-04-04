import 'package:flutter/material.dart';
import 'package:fontes_organizapp/Models/Subjects.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modalbottom;

class SubjectsPage extends StatefulWidget {
  final String path;
  const SubjectsPage({super.key, required this.path});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  late String path;
  List<Subject> subjects = [];
  List<Widget> subjectCards = [];
  
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
  Future<List<Widget>> loadSubjects() async {
    try {
      showSubjects();
      Subject subject = Subject(id: 0, name: '', hours: 0);
      subjectCards=subject.buildSubjectCard(context,subjects,path);
    } catch (e) {
      print(e);
      print("Erro ao abrir o banco de dados.");
      return [];
    }
    return subjectCards;
  }
  @override
  void initState() {
    setState(() {
      path = widget.path;
      print('Caminho do banco de dados: $path'); 
      showSubjects();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    int _selectedIndex=1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 50)),
              Text(
                'Matérias',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.1),
            FutureBuilder<List<Widget>>(
              future: loadSubjects(),
              builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Nenhuma matéria encontrada.');
              } else {
                return Column(
                  children: snapshot.data!,
                );
              }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Matérias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.warning_amber_rounded),
          label: 'Faltas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        switch(index){
          case 0:
          Navigator.popAndPushNamed(context, '/home',arguments: path);
          case 1:
          Navigator.popAndPushNamed(context, '/subjects', arguments: path);
          case 2:
            Navigator.popAndPushNamed(context, '/createSubjects', arguments: path);
          case 3:
          default: break;


        }

      },
      backgroundColor: Colors.deepPurpleAccent,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.black54,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 20,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.black,
        size: 18,
      )),
    );
  }
}