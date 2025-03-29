class Absense {
  // Identificador único da ausência
  int id;

  // Identificador da matéria associada à ausência
  int id_subject;

  // Data da ausência
  String data;

  // Construtor da classe Absense, que exige os valores para id, id_subject e data
  Absense({required this.id, required this.id_subject, required this.data});
}