import 'package:app_carros/CarrosController.dart';
import 'package:app_carros/TelaDetalheCarros.dart';
import 'package:flutter/material.dart';

class TelaListaCarros extends StatelessWidget {
  final ControllerCarros controllerCarros;

  TelaListaCarros(this.controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Carros'),
      ),
      body: ListView.builder(
        itemCount: controllerCarros.listarCarros.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controllerCarros.listarCarros[index].modelo),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetalhesCarro(controllerCarros.listarCarros[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar novo carro
          controllerCarros.adicionarCarro(
            "Novo Modelo",
            2023,
            "https://example.com/novo_modelo.jpg",
          );

          // Atualizar a interface
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}
