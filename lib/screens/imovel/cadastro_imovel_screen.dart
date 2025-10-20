import 'package:flutter/material.dart';
import '../../models/casa_model.dart';
import '../../services/casa_service.dart';

class CadastroImovelScreen extends StatefulWidget {
  const CadastroImovelScreen({super.key});

  @override
  State<CadastroImovelScreen> createState() => _CadastroImovelScreenState();
}

class _CadastroImovelScreenState extends State<CadastroImovelScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _enderecoController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  void _cadastrarImovel() async {
    if (_tituloController.text.isEmpty ||
        _descricaoController.text.isEmpty ||
        _enderecoController.text.isEmpty ||
        _precoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
      return;
    }

    final casa = Casa(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: _tituloController.text,
      descricao: _descricaoController.text,
      preco: double.parse(_precoController.text),
      endereco: _enderecoController.text,
      imagemUrl: 'assets/placeholder.jpg',
    );

    try {
      await CasaService.cadastrarCasa(casa);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Imóvel cadastrado com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Imóvel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(controller: _tituloController, decoration: const InputDecoration(labelText: 'Título')),
            TextField(controller: _descricaoController, decoration: const InputDecoration(labelText: 'Descrição')),
            TextField(controller: _enderecoController, decoration: const InputDecoration(labelText: 'Endereço')),
            TextField(controller: _precoController, decoration: const InputDecoration(labelText: 'Preço')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _cadastrarImovel, child: const Text('Cadastrar Imóvel')),
          ],
        ),
      ),
    );
  }
}
