import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../home/home_locatario_screen.dart';
import '../../home/home_locador_screen.dart';
import '../../../services/usuario_service.dart';

class CadastroScreen extends StatefulWidget {
  final VoidCallback onToggleScreen;

  const CadastroScreen({
    super.key,
    required this.onToggleScreen,
  });

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  void _fazerCadastro(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.authData.isCadastroValid) {
      try {
        // 🔹 Salva localmente o novo usuário
        await UsuarioService.salvarUsuario(authProvider.authData);

        // 🔹 Marca como logado (opcional)
        authProvider.cadastrar(authProvider.authData.tipoUsuario);

        // 🔹 Mostra mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário cadastrado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );

        // 🔹 Redireciona conforme o tipo de usuário
        if (authProvider.authData.tipoUsuario == 'Locador') {
          Navigator.pushReplacementNamed(context, '/home_locador');
        } else {
          Navigator.pushReplacementNamed(context, '/home_locatario');
        }

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos corretamente'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(82, 115, 209, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            widget.onToggleScreen();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo da empresa
            Center(
              child: Image.asset(
                'assets/logoalugaai.png',
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            // Título
            const Text(
              'CADASTRE-SE',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Subtítulo
            Text(
              'Insira seus dados para se registrar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[100],
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Campo de Nome
            const Text(
              'Nome',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Seu nome completo',
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[450]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.grey[600]),
              onChanged: (value) {
                authProvider.updateNome(value);
              },
            ),

            const SizedBox(height: 16),

            // Campo de E-mail
            const Text(
              'E-mail',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'seu@email.com',
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[450]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.grey[600]),
              onChanged: (value) {
                authProvider.updateEmail(value);
              },
            ),

            const SizedBox(height: 16),

            // Campo de Número de celular
            const Text(
              'Número de celular',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '(00) 00000-0000',
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[450]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.grey[600]),
              onChanged: (value) {
                authProvider.updateTelefone(value);
              },
            ),

            const SizedBox(height: 16),

            // Campo de Senha
            const Text(
              'Senha',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '••••••',
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[450]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.grey[600]),
              onChanged: (value) {
                authProvider.updateSenha(value);
              },
            ),

            const SizedBox(height: 16),

            // Campo de Confirmar Senha
            const Text(
              'Confirme sua senha',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '••••••',
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[450]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.grey[600]),
              onChanged: (value) {
                authProvider.updateConfirmarSenha(value);
              },
            ),

            const SizedBox(height: 16),

            // Checkbox de termos e condições
            Row(
              children: [
                Checkbox(
                  value: authProvider.authData.aceitouTermos,
                  onChanged: (value) {
                    authProvider.updateAceitouTermos(value ?? false);
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.white;
                    },
                  ),
                  checkColor: const Color.fromRGBO(82, 115, 209, 1),
                ),
                const Text(
                  'Aceito termos e condições',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            
            // Tipo de usuário
            const Text(
              'Você é:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: authProvider.authData.tipoUsuario,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Locador', child: Text('Locador')),
                DropdownMenuItem(value: 'Locatário', child: Text('Locatário')),
              ],
              onChanged: (value) {
                authProvider.updateTipoUsuario(value ?? 'Locatário');
              },
            ),
            const SizedBox(height: 16),

            // Botão de Cadastrar (condicional)
            ElevatedButton(
              onPressed: authProvider.authData.isCadastroValid
                  ? () {
                      _fazerCadastro(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: authProvider.authData.isCadastroValid
                    ? const Color.fromRGBO(96, 165, 250, 1)
                    : Colors.grey[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Link para login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já possui uma conta? ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[100],
                  ),
                ),
                TextButton(
                  onPressed: widget.onToggleScreen,
                  child: const Text(
                    'Faça login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
