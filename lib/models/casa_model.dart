class Casa {
  final String id;
  final String titulo;
  final String descricao;
  final double preco;
  final String endereco;
  final String imagemUrl;
  final bool isDestaque;
  final bool isFavorita;

  Casa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.endereco,
    required this.imagemUrl,
    this.isDestaque = false,
    this.isFavorita = false,
  });

  factory Casa.fromJson(Map<String, dynamic> json) {
    return Casa(
      id: json['id'].toString(),
      titulo: json['titulo'] ?? '',
      descricao: json['descricao'] ?? '',
      preco: (json['preco'] ?? 0).toDouble(),
      endereco: json['endereco'] ?? '',
      imagemUrl: json['imagem_url'] ?? '',
      isDestaque: json['is_destaque'] ?? false,
      isFavorita: json['is_favorita'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'preco': preco,
      'endereco': endereco,
      'imagem_url': imagemUrl,
      'is_destaque': isDestaque,
      'is_favorita': isFavorita,
    };
  }
}
