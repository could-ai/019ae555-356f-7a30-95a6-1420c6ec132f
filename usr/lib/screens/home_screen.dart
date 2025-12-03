import 'package:flutter/material.dart';
import '../models/game.dart';
import '../widgets/game_card.dart';
import 'game_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyBlox', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de búsqueda / Hero
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent.shade700, Colors.purpleAccent.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100M+ Juegos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Explora el universo infinito de diversión en SkyBlox.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.rocket_launch, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),

            // Sección Destacados
            _buildSectionHeader('Destacados', () {}),
            SizedBox(
              height: 220,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: mockGames.length,
                itemBuilder: (context, index) {
                  return GameCard(
                    game: mockGames[index],
                    isWide: true,
                    onTap: () => _navigateToDetail(context, mockGames[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Categorías
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryChip(context, 'Todos', true),
                  _buildCategoryChip(context, 'Acción', false),
                  _buildCategoryChip(context, 'RPG', false),
                  _buildCategoryChip(context, 'Estrategia', false),
                  _buildCategoryChip(context, 'Deportes', false),
                  _buildCategoryChip(context, 'Puzzle', false),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Sección Populares
            _buildSectionHeader('Populares Ahora', () {}),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: mockGames.reversed.toList().length,
                itemBuilder: (context, index) {
                  final game = mockGames.reversed.toList()[index];
                  return GameCard(
                    game: game,
                    onTap: () => _navigateToDetail(context, game),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Sección Recomendados
            _buildSectionHeader('Para Ti', () {}),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                final game = mockGames[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        game.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (c,e,s) => Container(width: 60, height: 60, color: Colors.grey[800]),
                      ),
                    ),
                    title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(game.category, style: TextStyle(color: Colors.grey[400])),
                    trailing: ElevatedButton(
                      onPressed: () => _navigateToDetail(context, game),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(60, 30),
                      ),
                      child: const Text('Ver'),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Game game) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameDetailScreen(game: game)),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text('Ver todo'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Colors.grey[900],
        selectedColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
      ),
    );
  }
}
