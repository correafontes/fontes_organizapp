class Subject {
  // Identificador único da matéria
  int id;

  // Nome da matéria
  String name;

  // Quantidade de horas associadas à matéria
  int hours;

  // Construtor da classe Subject, que exige os campos id, name e hours
  Subject({required this.id, required this.name, required this.hours});
}