import 'package:app_help_flutter/screens/cadastro_form.dart';
import 'package:app_help_flutter/screens/duvida_lista.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/estudantes.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DuvidaLista(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.tealAccent[700],
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.normal,
                  highlightColor: Colors.tealAccent,
                  shape: StadiumBorder(),
                  elevation: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CadastroForm(),
                      ),
                    );
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.tealAccent[700],
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.normal,
                  highlightColor: Colors.tealAccent,
                  shape: StadiumBorder(),
                  elevation: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
