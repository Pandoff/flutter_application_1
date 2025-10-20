class AuthData {
  String nome;
  String email;
  String telefone;
  String senha;
  String confirmarSenha;
  bool aceitouTermos;
  String tipoUsuario;

  AuthData({
    this.nome = '',
    this.email = '',
    this.telefone = '',
    this.senha = '',
    this.confirmarSenha = '',
    this.aceitouTermos = false,
    this.tipoUsuario = 'Locatário',
  });

  AuthData copyWith({
    String? nome,
    String? email,
    String? telefone,
    String? senha,
    String? confirmarSenha,
    bool? aceitouTermos,
    String? tipoUsuario,
  }) {
    return AuthData(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      senha: senha ?? this.senha,
      confirmarSenha: confirmarSenha ?? this.confirmarSenha,
      aceitouTermos: aceitouTermos ?? this.aceitouTermos,
      tipoUsuario: tipoUsuario ?? this.tipoUsuario,
    );
  }

  bool get isLoginValid {
    return email.isNotEmpty && senha.isNotEmpty;
  }

  bool get isCadastroValid {
    return nome.isNotEmpty &&
        email.isNotEmpty &&
        telefone.isNotEmpty &&
        senha.isNotEmpty &&
        confirmarSenha.isNotEmpty &&
        senha == confirmarSenha &&
        aceitouTermos;
  }
  
  void clear() {
    nome = '';
    email = '';
    telefone = '';
    senha = '';
    confirmarSenha = '';
    aceitouTermos = false;
    tipoUsuario = 'Locatário';
  }
}
