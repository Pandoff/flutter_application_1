import 'package:flutter/material.dart';
import '../imovel/cadastro_imovel_screen.dart';
import '../home/widgets/casa_destaque_card.dart';
import 'package:provider/provider.dart';
import '../../providers/casa_provider.dart';

class HomeLocadorScreen extends StatelessWidget {
  const HomeLocadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final casaProvider = Provider.of<CasaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Imóveis'),
        backgroundColor: const Color.fromRGBO(82, 115, 209, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastroImovelScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: casaProvider.casas.length,
        itemBuilder: (context, index) {
          final casa = casaProvider.casas[index];
          return CasaDestaqueCard(
            casa: casa,
            onToggleFavorita: (_) {},
          );
        },
      ),
    );
  }
}
