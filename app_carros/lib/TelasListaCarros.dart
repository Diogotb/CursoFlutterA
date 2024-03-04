import 'package:app_carros/CarrosController.dart';
import 'package:app_carros/TelaDetalheCarros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarros extends StatelessWidget {
  final ControllerCarros controllerCarros;

  TelaListaCarros(this.controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Carros'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ControllerCarros>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarCarros.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.listarCarros[index].modelo),
                      // Checkbox para marcar a tarefa como concluída
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesCarro(
                                controllerCarros.listarCarros[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar novo carro
          _adicionarCarros(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarCarros(BuildContext context) {}
}
