import 'package:flutter/material.dart';
import '../../models/casa_model.dart';
import '../../services/casa_service.dart';
import 'widgets/casa_destaque_card.dart';
import 'widgets/casa_disponivel_card.dart';
import '../auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Casa> casasDestaque = CasaService.getCasasDestaque();
  final List<Casa> todasCasas = CasaService.getTodasCasas();
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavorita(String casaId) {
    setState(() {
      CasaService.toggleFavorita(casaId);
    });
  }

  void _sair(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(82, 115, 209, 1),
        elevation: 0,
        title: const Text(
          'Aluga Aí',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _selectedIndex == 0 ? _buildHomeContent() : _buildOtherScreens(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(82, 115, 209, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color.fromRGBO(82, 115, 209, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Joana Silva',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'joana.silva@email.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.switch_account,
            title: 'Trocar de perfil',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.history,
            title: 'Histórico de Casas',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.notifications,
            title: 'Notificações',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.location_on,
            title: 'Meus Endereços',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.help,
            title: 'Central de Ajuda',
            onTap: () {},
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Sair',
            onTap: () {
              _sair(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de pesquisa
          _buildSearchBar(),

          // Casas em Destaque
          _buildCasasDestaque(),

          // Casas Disponíveis
          _buildCasasDisponiveis(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar casas...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCasasDestaque() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Casas de Destaque',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: casasDestaque.length,
            itemBuilder: (context, index) {
              return CasaDestaqueCard(
                casa: casasDestaque[index],
                onToggleFavorita: _toggleFavorita,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCasasDisponiveis() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Casas disponíveis',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Grid com 2 cards por linha
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cards por linha
              crossAxisSpacing: 12, // Espaço entre cards horizontal
              mainAxisSpacing: 12, // Espaço entre cards vertical
              childAspectRatio: 0.65, // Proporção do card (largura/altura)
            ),
            itemCount: todasCasas.length,
            itemBuilder: (context, index) {
              return CasaDisponivelCard(
                casa: todasCasas[index],
                onToggleFavorita: _toggleFavorita,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOtherScreens() {
    switch (_selectedIndex) {
      case 1:
        return _buildFavoritosScreen();
      case 2:
        return _buildChatsScreen();
      case 3:
        return _buildPerfilScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildFavoritosScreen() {
    final favoritas = todasCasas.where((casa) => casa.isFavorita).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Minhas Curtidas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          favoritas.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      'Nenhuma casa curtida ainda',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : GridView.builder(
                  // CORREÇÃO: Removido Expanded
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: favoritas.length,
                  itemBuilder: (context, index) {
                    return CasaDisponivelCard(
                      casa: favoritas[index],
                      onToggleFavorita: _toggleFavorita,
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildChatsScreen() {
    return const Center(
      child: Text(
        'Chats',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildPerfilScreen() {
    return const Center(
      child: Text(
        'Meu Perfil',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromRGBO(82, 115, 209, 1),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Curtidas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
