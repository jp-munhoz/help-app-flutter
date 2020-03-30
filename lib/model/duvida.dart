class Duvida {
  final int id;
  final String curso;
  final String materia;
  final String duvida;

  Duvida(this.id, this.curso, this.materia, this.duvida);

  @override
  String toString() {
    return 'Duvida{id: $id, curso: $curso, materia:$materia, duvida:$duvida}';
  }

}