import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  bool aceitouTermos = false;

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
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
            ),
            
            const SizedBox(height: 16),
            
            // Checkbox de termos e condições
            Row(
              children: [
                Checkbox(
                  value: aceitouTermos,
                  onChanged: (value) {
                    setState(() {
                      aceitouTermos = value ?? false;
                    });
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
            
            // Botão de Cadastrar (condicional)
            ElevatedButton(
              onPressed: aceitouTermos
                  ? () {
                      // Lógica de cadastro aqui
                      //print('Cadastro realizado!');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: aceitouTermos
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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