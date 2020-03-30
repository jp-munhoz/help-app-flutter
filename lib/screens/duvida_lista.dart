import 'package:app_help_flutter/database/duvidaDAO.dart';
import 'package:app_help_flutter/model/duvida.dart';
import 'package:app_help_flutter/screens/duvida_form.dart';
import 'package:app_help_flutter/screens/duvida_form_editar.dart';
import 'package:flutter/material.dart';

class DuvidaLista extends StatefulWidget {
  @override
  _DuvidaListaState createState() => _DuvidaListaState();
}

class _DuvidaListaState extends State<DuvidaLista> {
  final DuvidaDao _dao = DuvidaDao();
  final List<Duvida> duvidas = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dúvidas'),
      ),
      body: FutureBuilder<List<Duvida>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Duvida> duvidas = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Duvida duvida = duvidas[index];
                  return _ItemDuvida(duvida);
                },
                itemCount: duvidas.length,
              );
              break;
          }
          return Text('Error 404');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.tealAccent[700],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DuvidaForm(),
            ),
          );
        },
      ),
    );
  }
}

class _ItemDuvida extends StatefulWidget {
  final Duvida duvida;

  _ItemDuvida(this.duvida);

  @override
  __ItemDuvidaState createState() => __ItemDuvidaState();
}

class __ItemDuvidaState extends State<_ItemDuvida> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: RaisedButton.icon(
                          onPressed: () {
                            final DuvidaDao _dao = DuvidaDao();
                            _dao.delete(widget.duvida.id).then(
                                  (id) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DuvidaLista(),
                                    ),
                                  ),
                                );
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          textTheme: ButtonTextTheme.normal,
                          shape: StadiumBorder(),
                          icon: Icon(Icons.delete_forever),
                          label: Text('Excluir'),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DuvidaFormEdit(widget.duvida);
                          }));
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        textTheme: ButtonTextTheme.normal,
                        shape: StadiumBorder(),
                        icon: Icon(Icons.edit),
                        label: Text('Editar'),
                      ),
                    ],
                  ),
                ),
              ],
              title: Center(
                child: Text('O que deseja fazer?'),
              ),
            );
          },
        );
      },
      child: Card(
        child: ListTile(
          title: Text(widget.duvida.materia),
          subtitle: Text(widget.duvida.curso),
        ),
      ),
    );
  }
}
