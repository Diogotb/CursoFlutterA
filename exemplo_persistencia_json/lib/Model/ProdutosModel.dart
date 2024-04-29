class Produto {
<<<<<<< HEAD
=======
  //atributos
>>>>>>> 428d297440765348ca3f96ec54d9835ac5a0b5c4
  final String nome;
  final double preco;
  final String categoria;

<<<<<<< HEAD
  Produto({required this.nome, 
            required this.preco, 
            required this.categoria});
=======
  //construtor
  Produto({required this.nome, required this.preco, required this.categoria});

  //métodos
  
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }

>>>>>>> 428d297440765348ca3f96ec54d9835ac5a0b5c4

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
    };
  }
<<<<<<< HEAD
  factory Produto.fromJson(Map<String, dynamic>  map) {
    return Produto(
      nome: map['nome'],
      preco: map['preco'],
      categoria: map['categoria'],
    );
  }
}
=======
}
>>>>>>> 428d297440765348ca3f96ec54d9835ac5a0b5c4
