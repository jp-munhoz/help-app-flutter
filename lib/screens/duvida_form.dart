import 'package:app_help_flutter/database/duvidaDAO.dart';
import 'package:app_help_flutter/model/duvida.dart';
import 'package:app_help_flutter/screens/dashboard.dart';
import 'package:flutter/material.dart';

class DuvidaForm extends StatefulWidget {
  @override
  _DuvidaFormState createState() => _DuvidaFormState();
}

class _DuvidaFormState extends State<DuvidaForm> {
  final TextEditingController _cursoController = TextEditingController();

  final TextEditingController _duvidaController = TextEditingController();

  final TextEditingController _materiaController = TextEditingController();

  final DuvidaDao _dao = DuvidaDao();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cursoController.dispose();
    _duvidaController.dispose();
    super.dispose();
  }

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
            FocusScope.of(context).requestFocus(FocusNode());
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

                            final Duvida novaDuvida =
                                Duvida(0, curso, materia, duvida);
                            _dao.salvar(novaDuvida).then(
                                  (id) => Navigator.pop(context),
                                );
                          }
                        },
                        child: Text(
                          'Enviar',
                          style: TextStyle(fontSize: 15),
                        ),
                        color: Colors.tealAccent[700],
                        textColor: Colors.white,
                        textTheme: ButtonTextTheme.normal,
                        highlightColor: Colors.tealAccent,
                        shape: StadiumBorder(),
                        elevation: 10,
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        child: Text(
                          'Voltar',
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
