import 'package:flutter/material.dart';
import '../../../models/casa_model.dart';

class CasaDestaqueCard extends StatelessWidget {
  final Casa casa;
  final Function(String) onToggleFavorita;

  const CasaDestaqueCard({
    super.key,
    required this.casa,
    required this.onToggleFavorita,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagem da casa
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage(casa.imagemUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  children: [
                    // Botão compartilhar
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 16,
                      child: IconButton(
                        icon: const Icon(Icons.share, size: 14),
                        onPressed: () {
                          // Lógica para compartilhar
                        },
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Botão favorito
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 16,
                      child: IconButton(
                        icon: Icon(
                          casa.isFavorita
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 14,
                          color: casa.isFavorita ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          onToggleFavorita(casa.id);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Informações da casa
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'R\$${casa.preco.toInt()}/mês',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(82, 115, 209, 1),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  casa.endereco,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'Aluguel R\$${casa.preco.toInt()} (Negociável)',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
