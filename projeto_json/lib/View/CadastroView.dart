import 'package:flutter/material.dart';
import 'package:projeto_json/Model/ProdutosModel.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _descricaoController;
  late TextEditingController _quantidadeController;
  late TextEditingController _fotoController;
  late TextEditingController _precoController;
  late TextEditingController _categoriasController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _descricaoController = TextEditingController();
    _quantidadeController = TextEditingController();
    _fotoController = TextEditingController();
    _precoController = TextEditingController();
    _categoriasController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _quantidadeController.dispose();
    _fotoController.dispose();
    _precoController.dispose();
    _categoriasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      int.tryParse(value) == null) {
                    return 'Por favor, insira uma quantidade válida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fotoController,
                decoration: InputDecoration(labelText: 'URL da Foto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a URL da foto do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precoController,
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null) {
                    return 'Por favor, insira um preço válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoriasController,
                decoration: InputDecoration(labelText: 'Categorias'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira pelo menos uma categoria';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Formulário validado, agora você pode salvar os dados
                    final produto = Produto(
                      id: 0, // Você precisa definir a lógica para gerar IDs
                      nome: _nomeController.text,
                      descricao: _descricaoController.text,
                      quantidade: int.parse(_quantidadeController.text),
                      foto: _fotoController.text,
                      preco: double.parse(_precoController.text),
                      categoria: _categoriasController.text.split(','),
                    );
                    // Aqui você pode fazer o que quiser com o objeto de produto
                    print(produto);
                  }
                },
                child: Text('Cadastrar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
