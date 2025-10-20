import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/auth_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/casa_provider.dart';
import 'screens/imovel/cadastro_imovel_screen.dart';
import 'screens/imovel/busca_imovel_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CasaProvider()),
      ],
      child: MaterialApp(
        title: 'Aluga Aí',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthScreen(),
          '/cadastro_imovel': (context) => const CadastroImovelScreen(),
          '/buscar_imovel': (context) => const BuscaImovelScreen(),
        },
      ),
    );
  }
}
