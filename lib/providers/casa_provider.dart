import 'package:flutter/material.dart';
import '../models/casa_model.dart';
import '../services/casa_service.dart';

class CasaProvider with ChangeNotifier {
  List<Casa> _casas = CasaService.casas;
  final TextEditingController _searchController = TextEditingController();

  List<Casa> get casas => _casas;
  List<Casa> get casasDestaque => _casas.where((casa) => casa.isDestaque).toList();
  List<Casa> get casasFavoritas => _casas.where((casa) => casa.isFavorita).toList();
  TextEditingController get searchController => _searchController;

  void toggleFavorita(String casaId) {
    final index = _casas.indexWhere((casa) => casa.id == casaId);
    if (index != -1) {
      _casas[index] = _casas[index].copyWith(
        isFavorita: !_casas[index].isFavorita,
      );
      notifyListeners();
    }
  }

  void filtrarCasas(String query) {
    // Implementar lógica de filtro futuramente
    notifyListeners();
  }

  void clearSearch() {
    _searchController.clear();
    notifyListeners();
  }
}