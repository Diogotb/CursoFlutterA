import 'package:exemplo_json/Model/produtos_model.dart';
import 'package:flutter/material.dart';

class ProdutoInfoPage extends StatelessWidget {
  Produto info;
  ProdutoInfoPage({
    required this.info
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto Info'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(produto.foto),
            Text(produto.nome),
            Text('${produto.preco.toStringAsFixed(2)}'),
            Text(produto.categoria)
          ],
        ),
      ),
    );
  }
}
