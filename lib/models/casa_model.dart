class Casa {
  final String id;
  final String titulo;
  final String endereco;
  final double preco;
  final String imagemUrl;
  final bool isFavorita;
  final bool isDestaque;

  Casa({
    required this.id,
    required this.titulo,
    required this.endereco,
    required this.preco,
    required this.imagemUrl,
    this.isFavorita = false,
    this.isDestaque = false,
  });

  Casa copyWith({
    String? id,
    String? titulo,
    String? endereco,
    double? preco,
    String? imagemUrl,
    bool? isFavorita,
    bool? isDestaque,
  }) {
    return Casa(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      endereco: endereco ?? this.endereco,
      preco: preco ?? this.preco,
      imagemUrl: imagemUrl ?? this.imagemUrl,
      isFavorita: isFavorita ?? this.isFavorita,
      isDestaque: isDestaque ?? this.isDestaque,
    );
  }
}
