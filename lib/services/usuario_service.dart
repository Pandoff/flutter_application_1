import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_model.dart';
import 'api_service.dart';

class UsuarioService {
  static Future<Map<String, dynamic>> salvarUsuario(AuthData authData) async {
    try {
      // Prepara os dados para a API
      final Map<String, dynamic> usuarioData = {
        'nome': authData.nome,
        'email': authData.email,
        'telefone': authData.telefone,
        'senha': authData.senha,
        'tipo_usuario': authData.tipoUsuario.toLowerCase(),
      };

      // Faz a requisição para sua API FastAPI
      final response = await ApiService.post('/usuarios/', usuarioData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return {
          'success': true,
          'usuario': responseData,
          'message': 'Usuário cadastrado com sucesso!'
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['detail'] ?? 'Erro ao cadastrar usuário'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erro de conexão: $e'
      };
    }
  }

  static Future<Map<String, dynamic>> login(String email, String senha) async {
    try {
      final Map<String, dynamic> loginData = {
        'email': email,
        'senha': senha,
      };

      final response = await ApiService.post('/usuarios/login', loginData);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return {
          'success': true,
          'usuario': responseData,
          'message': 'Login realizado com sucesso!'
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['detail'] ?? 'Erro ao fazer login'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erro de conexão: $e'
      };
    }
  }
}