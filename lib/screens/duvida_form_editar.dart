import 'package:app_help_flutter/database/duvidaDAO.dart';
import 'package:app_help_flutter/model/duvida.dart';
import 'package:flutter/material.dart';

class DuvidaFormEdit extends StatefulWidget {
  final Duvida duvida;

  const DuvidaFormEdit(this.duvida);
  @override
  _DuvidaFormEditState createState() => _DuvidaFormEditState();
}

class _DuvidaFormEditState extends State<DuvidaFormEdit> {
  final TextEditingController _cursoController = TextEditingController();

  final TextEditingController _duvidaController = TextEditingController();

  final TextEditingController _materiaController = TextEditingController();

  final DuvidaDao _dao = DuvidaDao();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Qual sua dúvida?'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira o Curso';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: _cursoController,
                    decoration: InputDecoration(
                      labelText: 'Curso',
                      icon: Icon(Icons.school),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira a Materia';
                        }
                        return null;
                      },
                      controller: _materiaController,
                      decoration: InputDecoration(
                          labelText: 'Materia', icon: Icon(Icons.border_color)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 32.0),
                    child: TextFormField(
                      controller: _duvidaController,
                      decoration: InputDecoration(
                          labelText: 'Duvida',
                          icon: Icon(Icons.question_answer)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final String curso = _cursoController.text;
                            final String materia = _materiaController.text;
                            final String duvida = _duvidaController.text;

                            final Duvida editaDuvida = Duvida(
                                widget.duvida.id, curso, materia, duvida);

                            _dao.editar(editaDuvida).then(
                                  (id) => Navigator.pop(context),
                                );
                          }
                        },
                        child: Text(
                          'Alterar',
                          style: TextStyle(fontSize: 15),
                        ),
                        color: Colors.tealAccent[700],
                        textColor: Colors.white,
                        textTheme: ButtonTextTheme.normal,
                        highlightColor: Colors.tealAccent,
                        shape: StadiumBorder(),
                        elevation: 10,
                      ),
                      Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
