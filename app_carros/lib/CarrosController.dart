import 'package:app_carros/CarrosModel.dart';

class ControllerCarros {
  List<Carro> _carros = [];

  List<Carro> get listarCarros => _carros;

  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    Carro novoCarro = Carro(modelo, ano, imagemUrl);
    _carros.add(novoCarro);
  }
}
