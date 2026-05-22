import 'package:flutter/material.dart';
import 'package:clase_flutter/Screens/explorer_screen.dart';

class Review {
  final String id;
  final String content;
  int rating;
  final String songTitle;
  final String artist;
  int likes;
  bool liked;

  Review({
    required this.id,
    required this.content,
    required this.rating,
    required this.songTitle,
    required this.artist,
    this.likes = 0,
    this.liked = false,
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _nombre = 'Music Lover';
  final String _usuario = '@MusicLover';
  final String _ubicacion = 'Lima, Perú';
  final bool _mostrarUbicacion = true;
  final int _seguidores = 124;
  final int _siguiendo = 67;

  final List<Review> _reviews = [
    Review(
      id: '1',
      songTitle: 'The Nights',
      artist: 'Avicii',
      content: 'Una canción que te hace sentir vivo. Imposible no cantarla.',
      rating: 5,
      likes: 32,
    ),
    Review(
      id: '2',
      songTitle: 'Levitating',
      artist: 'Dua Lipa',
      content: 'Pista para bailar de principio a fin. Producción impecable.',
      rating: 4,
      likes: 18,
    ),
    Review(
      id: '3',
      songTitle: 'Bohemian Rhapsody',
      artist: 'Queen',
      content: 'Obra maestra atemporal. Cada sección es una sorpresa.',
      rating: 5,
      likes: 47,
    ),
  ];

  void _openSettings() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _openExplorer() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ExplorerScreen()),
    );
  }

  void _onEditProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Editar perfil (pendiente)')),
    );
  }

  void _onProfileImageTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cambiar foto de perfil (pendiente)')),
    );
  }

  void _onEditReview(Review review) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Editar reseña de "${review.songTitle}"')),
    );
  }

  void _onLikeReview(Review review) {
    setState(() {
      if (review.liked) {
        review.liked = false;
        review.likes -= 1;
      } else {
        review.liked = true;
        review.likes += 1;
      }
    });
  }

  void _confirmDeleteReview(Review review) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Eliminar reseña'),
          content: const Text(
            '¿Estás seguro de que quieres eliminar esta reseña?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() => _reviews.removeWhere((r) => r.id == review.id));
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

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
                ProfileHeader(
                  nombre: _nombre,
                  usuario: _usuario,
                  ubicacion: _mostrarUbicacion ? _ubicacion : null,
                  resenas: _reviews.length.toString(),
                  seguidores: _seguidores.toString(),
                  siguiendo: _siguiendo.toString(),
                  onOpenSettings: _openSettings,
                  onOpenExplorer: _openExplorer,
                  onProfileImageTap: _onProfileImageTap,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: _reviews.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            const SizedBox(height: 12),
                            Center(
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.6,
                                height: 44,
                                child: BotonGeneral(
                                  texto: 'Editar perfil',
                                  fontSize: 12,
                                  onPressed: _onEditProfile,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'Mis Reseñas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      final review = _reviews[index - 1];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: ReviewCard(
                          review: review,
                          mostrarBotones: true,
                          onDelete: () => _confirmDeleteReview(review),
                          onEdit: () => _onEditReview(review),
                          onLike: () => _onLikeReview(review),
                        ),
                      );
                    },
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

class ProfileHeader extends StatelessWidget {
  final String nombre;
  final String usuario;
  final String? ubicacion;
  final String resenas;
  final String seguidores;
  final String siguiendo;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenExplorer;
  final VoidCallback onProfileImageTap;

  const ProfileHeader({
    super.key,
    required this.nombre,
    required this.usuario,
    required this.ubicacion,
    required this.resenas,
    required this.seguidores,
    required this.siguiendo,
    required this.onOpenSettings,
    required this.onOpenExplorer,
    required this.onProfileImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/backgroundplanosuperior.png',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onOpenExplorer,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onOpenSettings,
                  child: Image.asset(
                    'assets/images/cerrarsesionmorado.png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProfileImage(onTap: onProfileImageTap),
              ProfileUserInfo(nombre: nombre, usuario: usuario),
              if (ubicacion != null) ...[
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.place,
                      color: Color(0xFFB39DDB),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      ubicacion!,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 12),
              ProfileEstadisticas(
                resenas: resenas,
                seguidores: seguidores,
                siguiendo: siguiendo,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileImage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125,
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFB39DDB), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/foto_default.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileUserInfo extends StatelessWidget {
  final String nombre;
  final String usuario;

  const ProfileUserInfo({
    super.key,
    required this.nombre,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            nombre,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            usuario,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileEstadisticas extends StatelessWidget {
  final String resenas;
  final String seguidores;
  final String siguiendo;

  const ProfileEstadisticas({
    super.key,
    required this.resenas,
    required this.seguidores,
    required this.siguiendo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EstadisticaItem(numero: resenas, etiqueta: 'Reseñas'),
        EstadisticaItem(numero: seguidores, etiqueta: 'Seguidores'),
        EstadisticaItem(numero: siguiendo, etiqueta: 'Siguiendo'),
      ],
    );
  }
}

class EstadisticaItem extends StatelessWidget {
  final String numero;
  final String etiqueta;

  const EstadisticaItem({
    super.key,
    required this.numero,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numero,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          etiqueta,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;
  final bool mostrarBotones;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onLike;

  const ReviewCard({
    super.key,
    required this.review,
    required this.mostrarBotones,
    required this.onDelete,
    required this.onEdit,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF5D5080),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.songTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      review.artist,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (mostrarBotones) ...[
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Color(0xFFB39DDB),
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Color(0xFFB39DDB),
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                i < review.rating ? Icons.star : Icons.star_border,
                color: const Color(0xFFB39DDB),
                size: 18,
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            review.content,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              GestureDetector(
                onTap: onLike,
                child: Icon(
                  review.liked ? Icons.favorite : Icons.favorite_border,
                  color: review.liked
                      ? Colors.redAccent
                      : const Color(0xFFB39DDB),
                  size: 20,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                review.likes.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BotonGeneral extends StatelessWidget {
  final String texto;
  final double fontSize;
  final VoidCallback onPressed;

  const BotonGeneral({
    super.key,
    required this.texto,
    required this.onPressed,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white),
          backgroundColor: const Color(0xFF8E24AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}
