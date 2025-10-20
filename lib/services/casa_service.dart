import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/casa_model.dart';
import 'api_service.dart';

class CasaService {
  // 🔹 Ainda mantemos os dados estáticos para exibir se a API estiver offline
  static List<Casa> casas = [
    Casa(
      id: '1',
      titulo: 'Casa com Piscina',
      descricao: 'Linda casa com 3 quartos e piscina',
      preco: 1500.0,
      endereco: 'Rua das Flores, 123',
      imagemUrl: 'assets/casa1.jpg',
      isDestaque: true,
      isFavorita: false,
    ),
    Casa(
      id: '2',
      titulo: 'Apartamento Moderno',
      descricao: 'Apartamento novo com 2 quartos',
      preco: 900.0,
      endereco: 'Av. Principal, 456',
      imagemUrl: 'assets/casa2.jpg',
      isDestaque: false,
      isFavorita: true,
    ),
  ];

  // 🧠 Busca casas do backend FastAPI
  static Future<List<Casa>> buscarCasas() async {
    try {
      final response = await ApiService.get('/casas/');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final casasApi = data.map((json) => Casa.fromJson(json)).toList();

        // Opcional: manter as imagens locais
        for (int i = 0; i < casasApi.length && i < casas.length; i++) {
          casasApi[i] = casasApi[i].copyWith(imagemUrl: casas[i].imagemUrl);
        }

        return casasApi;
      } else {
        throw Exception('Erro ao carregar casas: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Erro ao conectar à API: $e');
      // Retorna as casas estáticas como fallback
      return casas;
    }
  }

  // 🔹 Adiciona uma casa no backend
  static Future<bool> adicionarCasa(Casa casa) async {
    try {
      final response = await ApiService.post('/casas/', casa.toJson());
      return response.statusCode == 201;
    } catch (e) {
      print('Erro ao adicionar casa: $e');
      return false;
    }
  }

  // 🔹 Busca casa pelo ID
  static Future<Casa?> buscarCasaPorId(String id) async {
    try {
      final response = await ApiService.get('/casas/$id');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Casa.fromJson(data);
      }
    } catch (e) {
      print('Erro ao buscar casa por ID: $e');
    }
    return null;
  }
}
