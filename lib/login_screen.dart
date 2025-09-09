import 'package:flutter/material.dart';
import 'package:flutter_application1/cadastro_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(82, 115, 209, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            //Logo da empresa
            Center(
              child: Image.asset(
                'assets/logoalugaai.png',
                height: 90,
                width: 90,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // Título
            const Text(
              'Aluga aí',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 6),
            
            // Subtítulo
            Text(
              'Faça Login na sua conta',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[100],
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 30),
            
            // Campo de usuário
            const Text(
              'Usuário',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 8),
            
            TextFormField(
              decoration: InputDecoration(
                hintText: 'usuário',
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
                  borderSide: const BorderSide(color: Colors.white)
                )
              ),
              style: TextStyle(color: Colors.grey[600]),
            ),
            
            const SizedBox(height: 16),
            
            // Campo de senha
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
                )
              ),
              style: TextStyle(color: Colors.grey[600]),
            ),
            
            const SizedBox(height: 8),
            
            // Esqueceu a senha
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Botão de Login
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(96, 165, 250, 1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Divisor "Ou entre com"
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Ou entre com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[100],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Botões de redes sociais (placeholder)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/google.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                
                const SizedBox(width: 20),
                
                // Facebook
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/facebook.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Link para cadastro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não possui uma conta? ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[100],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const CadastroScreen()),
                    );
                  },
                  child: const Text(
                    'Cadastre-se',
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