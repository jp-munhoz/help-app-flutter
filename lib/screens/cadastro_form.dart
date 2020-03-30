import 'package:app_help_flutter/screens/dashboard.dart';
import 'package:flutter/material.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro do Aluno'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    focusNode: FocusNode(),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SingleChildScrollView(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'RA',
                        icon: Icon(Icons.assignment_ind),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 32.0),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Curso',
                        icon: Icon(Icons.school),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 100,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          color: Colors.tealAccent[700],
                          textColor: Colors.white,
                          textTheme: ButtonTextTheme.normal,
                          highlightColor: Colors.tealAccent,
                          shape: StadiumBorder(),
                          elevation: 10,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 100,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ));
                          },
                          child: Text(
                            'Voltar',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          color: Colors.tealAccent[700],
                          textColor: Colors.white,
                          textTheme: ButtonTextTheme.normal,
                          highlightColor: Colors.tealAccent,
                          shape: StadiumBorder(),
                          elevation: 10,
                        ),
                      ),
                      Spacer(flex: 7),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
