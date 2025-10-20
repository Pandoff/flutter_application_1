import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/casa_provider.dart';
import '../home/widgets/casa_disponivel_card.dart';

class HomeLocatarioScreen extends StatelessWidget {
  const HomeLocatarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final casaProvider = Provider.of<CasaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casas Disponíveis'),
        backgroundColor: const Color.fromRGBO(82, 115, 209, 1),
      ),
      body: ListView.builder(
        itemCount: casaProvider.casas.length,
        itemBuilder: (context, index) {
          final casa = casaProvider.casas[index];
          return CasaDisponivelCard(
            casa: casa,
            onToggleFavorita: casaProvider.toggleFavorita,
          );
        },
      ),
    );
  }
}
