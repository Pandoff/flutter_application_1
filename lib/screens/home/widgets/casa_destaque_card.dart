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

  static const Map<String, String> _imagensCasas = {
    '1': 'assets/casas/casa1.jpeg',
    '2': 'assets/casas/casa2.jpeg',
    '3': 'assets/casas/casa3.jpeg',
    '4': 'assets/casas/casa4.jpeg',
    '5': 'assets/casas/casa5.jpeg',
    '6': 'assets/casas/casa6.jpeg',
  };

  String _getImagemCasa(String casaId) {
    return _imagensCasas[casaId] ?? 'assets/casas/casa1.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // evita overflow
        children: [
          // Imagem da casa
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage(_getImagemCasa(casa.id)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Evita overflow horizontal
                  children: [
                    // Botão compartilhar
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 14, 
                      child: IconButton(
                        icon: const Icon(Icons.share, size: 12), 
                        onPressed: () {
                          // Lógica para compartilhar
                        },
                        padding: EdgeInsets.zero, // Remove padding extra
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Botão favorito
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 14,
                      child: IconButton(
                        icon: Icon(
                          casa.isFavorita
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 12,
                          color: casa.isFavorita ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          onToggleFavorita(casa.id);
                        },
                        padding: EdgeInsets.zero, // Remove padding extra
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Informações da casa
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // evita overflow vertical
              children: [
                Text(
                  'R\$${casa.preco.toInt()}/mês',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(82, 115, 209, 1),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  casa.endereco,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2, // Permite 2 linhas para endereços longos
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), 
                Text(
                  'Aluguel R\$${casa.preco.toInt()} (Negociável)',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}