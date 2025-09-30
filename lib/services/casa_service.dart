import '../models/casa_model.dart';

class CasaService {
  static final List<Casa> casas = [
    Casa(
      id: '1',
      titulo: 'Casa Moderna',
      endereco: 'Rua das Rosas, N° 406',
      preco: 800.0,
      imagemUrl: 'assets/casas/casa1.jpg',
      isDestaque: true,
    ),
    Casa(
      id: '2',
      titulo: 'Casa Compacta',
      endereco: 'Rua das Motos, N° 155',
      preco: 550.0,
      imagemUrl: 'assets/casas/casa2.jpg',
      isDestaque: true,
    ),
    Casa(
      id: '3',
      titulo: 'Casa Familiar',
      endereco: 'Rua Floriano Peixoto, N° 20',
      preco: 900.0,
      imagemUrl: 'assets/casas/casa3.jpg',
      isDestaque: true,
    ),
    Casa(
      id: '4',
      titulo: 'Casa Luxuosa',
      endereco: 'Rua das Flores, N° A12',
      preco: 1200.0,
      imagemUrl: 'assets/casas/casa4.jpg',
      isDestaque: true,
    ),
    Casa(
      id: '5',
      titulo: 'Apartamento Confortável',
      endereco: 'Av. Principal, N° 300',
      preco: 750.0,
      imagemUrl: 'assets/casas/casa5.jpg',
    ),
    Casa(
      id: '6',
      titulo: 'Casa com Jardim',
      endereco: 'Rua dos Lírios, N° 45',
      preco: 950.0,
      imagemUrl: 'assets/casas/casa6.jpg',
    ),
  ];

  static List<Casa> getCasasDestaque() {
    return casas.where((casa) => casa.isDestaque).toList();
  }

  static List<Casa> getTodasCasas() {
    return casas;
  }

  static void toggleFavorita(String casaId) {
    final index = casas.indexWhere((casa) => casa.id == casaId);
    if (index != -1) {
      casas[index] = casas[index].copyWith(
        isFavorita: !casas[index].isFavorita,
      );
    }
  }
}
