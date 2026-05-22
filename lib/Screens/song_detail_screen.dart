import 'package:flutter/material.dart';
import 'package:clase_flutter/Screens/explorer_screen.dart';

class SongReview {
  final String id;
  final String userId;
  final String userName;
  final int rating;
  final String content;

  const SongReview({
    required this.id,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.content,
  });
}

const _mockReviews = <SongReview>[
  SongReview(
    id: 'r1',
    userId: 'u1',
    userName: 'Music Lover',
    rating: 5,
    content:
        'No me canso de escucharla. Cada vez que suena me trae recuerdos buenísimos.',
  ),
  SongReview(
    id: 'r2',
    userId: 'u2',
    userName: 'IndieFan22',
    rating: 4,
    content:
        'Producción impecable y melodía pegajosa. Le faltó un poco más de variación.',
  ),
  SongReview(
    id: 'r3',
    userId: 'u3',
    userName: 'Synthhead',
    rating: 5,
    content:
        'Un clásico moderno. La transición del puente al último coro es magistral.',
  ),
];

class _Colors {
  static const violetaClaro = Color(0xFFB39DDB);
  static const vclaro = Color(0xFF5D5080);
}

class SongDetailScreen extends StatelessWidget {
  final Song song;

  const SongDetailScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundplano.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SongDetailHeader(onBack: () => Navigator.of(context).pop()),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const SongAlbumCover(),
                        const SizedBox(height: 20),
                        SongTitleSection(
                          nombre: song.nombre,
                          artista: song.artista,
                        ),
                        const SizedBox(height: 30),
                        SongInfoSection(song: song),
                        SongDescriptionSection(
                          descripcion: song.descripcion,
                        ),
                        SongReviewsSection(
                          reviews: _mockReviews,
                          onUserClick: (userId) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Abrir perfil de $userId'),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongDetailHeader extends StatelessWidget {
  final VoidCallback onBack;

  const SongDetailHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundplanosuperior.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onBack,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Detalle de canción',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongAlbumCover extends StatelessWidget {
  const SongAlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _Colors.violetaClaro, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'assets/images/foto_default.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SongTitleSection extends StatelessWidget {
  final String nombre;
  final String artista;

  const SongTitleSection({
    super.key,
    required this.nombre,
    required this.artista,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nombre,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          artista,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: _Colors.violetaClaro,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class SongInfoSection extends StatelessWidget {
  final Song song;

  const SongInfoSection({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRow(label: 'Álbum', value: song.album),
        DetailRow(label: 'Año', value: song.anio),
        DetailRow(label: 'Género', value: song.genero),
        DetailRow(label: 'Duración', value: song.duracion),
        DetailRow(label: 'Reprod.', value: song.reproducciones),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongDescriptionSection extends StatelessWidget {
  final String descripcion;

  const SongDescriptionSection({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descripción',
              style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              descripcion,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongReviewsSection extends StatelessWidget {
  final List<SongReview> reviews;
  final ValueChanged<String> onUserClick;

  const SongReviewsSection({
    super.key,
    required this.reviews,
    required this.onUserClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reseñas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (reviews.isEmpty)
            Text(
              'Aún no hay reseñas para esta canción',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            )
          else
            ...reviews.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SongReviewCard(
                  review: r,
                  onUserClick: () => onUserClick(r.userId),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SongReviewCard extends StatelessWidget {
  final SongReview review;
  final VoidCallback onUserClick;

  const SongReviewCard({
    super.key,
    required this.review,
    required this.onUserClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _Colors.vclaro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onUserClick,
            child: Text(
              '@${review.userName}',
              style: const TextStyle(
                color: _Colors.violetaClaro,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < review.rating ? Icons.star : Icons.star_border,
                color: _Colors.violetaClaro,
                size: 16,
              );
            }),
          ),
          const SizedBox(height: 6),
          Text(
            review.content,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
