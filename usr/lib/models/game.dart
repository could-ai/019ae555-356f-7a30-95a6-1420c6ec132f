class Game {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final double rating;
  final String description;

  Game({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.description,
  });
}

final List<Game> mockGames = [
  Game(
    id: '1',
    title: 'Sky Legends',
    imageUrl: 'https://picsum.photos/id/1018/400/600',
    category: 'Aventura',
    rating: 4.8,
    description: 'Explora islas flotantes en este épico RPG de mundo abierto.',
  ),
  Game(
    id: '2',
    title: 'Cyber Racer 2077',
    imageUrl: 'https://picsum.photos/id/1025/400/600',
    category: 'Carreras',
    rating: 4.5,
    description: 'Carreras de alta velocidad en una metrópolis de neón.',
  ),
  Game(
    id: '3',
    title: 'Block Builder Pro',
    imageUrl: 'https://picsum.photos/id/10/400/600',
    category: 'Simulación',
    rating: 4.9,
    description: 'Construye tu propio mundo bloque a bloque.',
  ),
  Game(
    id: '4',
    title: 'Zombie Arena',
    imageUrl: 'https://picsum.photos/id/1003/400/600',
    category: 'Acción',
    rating: 4.2,
    description: 'Sobrevive a oleadas de zombies con tus amigos.',
  ),
  Game(
    id: '5',
    title: 'Space Odyssey',
    imageUrl: 'https://picsum.photos/id/1002/400/600',
    category: 'Estrategia',
    rating: 4.7,
    description: 'Conquista la galaxia y gestiona tus recursos.',
  ),
  Game(
    id: '6',
    title: 'Mystery Mansion',
    imageUrl: 'https://picsum.photos/id/1016/400/600',
    category: 'Puzzle',
    rating: 4.3,
    description: 'Resuelve misterios en una casa embrujada.',
  ),
];
