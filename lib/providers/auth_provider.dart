import 'package:flutter/material.dart';
import '../models/auth_model.dart';
import '../services/usuario_service.dart';

class AuthProvider with ChangeNotifier {
  AuthData _authData = AuthData();
  bool _isLoggedIn = false;
  String? tipoUsuario;

  AuthData get authData => _authData;
  bool get isLoggedIn => _isLoggedIn;

  void updateNome(String nome) {
    _authData = _authData.copyWith(nome: nome);
    notifyListeners();
  }

  void updateEmail(String email) {
    _authData = _authData.copyWith(email: email);
    notifyListeners();
  }

  void updateTelefone(String telefone) {
    _authData = _authData.copyWith(telefone: telefone);
    notifyListeners();
  }

  void updateSenha(String senha) {
    _authData = _authData.copyWith(senha: senha);
    notifyListeners();
  }

  void updateConfirmarSenha(String confirmarSenha) {
    _authData = _authData.copyWith(confirmarSenha: confirmarSenha);
    notifyListeners();
  }

  void updateAceitouTermos(bool aceitouTermos) {
    _authData = _authData.copyWith(aceitouTermos: aceitouTermos);
    notifyListeners();
  }

  void updateTipoUsuario(String tipoUsuario) {
    _authData = _authData.copyWith(tipoUsuario: tipoUsuario);
    notifyListeners();
  }

  Future<bool> login() async {
    final result = await UsuarioService.login(_authData.email, _authData.senha);

    if (result['success']) {
      final usuario = result['usuario'];
      _isLoggedIn = true;
      tipoUsuario = usuario['tipo_usuario'];
      _authData = _authData.copyWith(
        nome: usuario['nome'],
        email: usuario['email'],
        telefone: usuario['telefone'],
        tipoUsuario: usuario['tipo_usuario'],
      );
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> cadastrar(String tipo) async {
    final result = await UsuarioService.salvarUsuario(_authData);
    if (result['success']) {
      _isLoggedIn = true;
      tipoUsuario = tipo;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    _authData.clear();
    tipoUsuario = null;
    notifyListeners();
  }
}
