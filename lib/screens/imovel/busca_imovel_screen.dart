import 'package:flutter/material.dart';
import '../../models/casa_model.dart';
import '../../services/casa_service.dart';

class BuscaImovelScreen extends StatefulWidget {
  const BuscaImovelScreen({super.key});

  @override
  State<BuscaImovelScreen> createState() => _BuscaImovelScreenState();
}

class _BuscaImovelScreenState extends State<BuscaImovelScreen> {
  List<Casa> _resultados = [];
  final _buscaController = TextEditingController();

  void _buscar() async {
    final query = _buscaController.text.toLowerCase();
    final casas = await CasaService.buscarCasas();
    setState(() {
      _resultados = casas
          .where((casa) =>
              casa.titulo.toLowerCase().contains(query) ||
              casa.endereco.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Imóvel')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _buscaController,
              decoration: InputDecoration(
                hintText: 'Digite o nome ou endereço...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _buscar,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _resultados.length,
              itemBuilder: (context, index) {
                final casa = _resultados[index];
                return ListTile(
                  title: Text(casa.titulo),
                  subtitle: Text('${casa.endereco} - R\$${casa.preco}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
