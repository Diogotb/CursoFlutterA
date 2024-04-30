import 'package:flutter/material.dart';

class CadastrarLivroScreen extends StatefulWidget {
  const CadastrarLivroScreen({super.key});

  @override
  State<CadastrarLivroScreen> createState() => _CadastrarLivroScreenState();
}

class _CadastrarLivroScreenState extends State<CadastrarLivroScreen> {
  //Criar os Controllers Texto // Validações
  TextEditingController _tituloControllers = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Livro'),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Título do Livro',
                ),
                controller: _tituloControllers,
                validator: (value) {
                  if (value?.trim().isEmpty?? true) {
                    return 'Insira um título';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Autor',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Editora',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sinopse',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ISBN',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Preço',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
