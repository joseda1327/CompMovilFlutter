import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo morado con estrellitas
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundplano.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ProfileHeader(),
                SizedBox(height: 12),
                Center(
                  child: SizedBox(
                    width: 240,
                    child: SignButton(buttonName: 'Editar perfil'),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Mis Reseñas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ReviewCard(),
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
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo superior (degradado azul-morado) solo en el encabezado
        Positioned.fill(
          child: Image.asset(
            'assets/images/backgroundplanosuperior.png',
            fit: BoxFit.cover,
          ),
        ),
        // Icono cerrar sesión arriba a la derecha
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              'assets/images/cerrarsesionmorado.png',
              width: 28,
              height: 28,
            ),
          ),
        ),
        // Contenido del encabezado
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProfileImage(),
              ProfileUserInfo(nombre: 'Music Lover', usuario: '@MusicLover'),
              SizedBox(height: 12),
              ProfileEstadisticas(resenas: '0', seguidores: '0', siguiendo: '0'),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFB39DDB), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/foto_default.png', fit: BoxFit.cover),
      ),
    );
  }
}

class ProfileUserInfo extends StatelessWidget {
  final String nombre;
  final String usuario;

  const ProfileUserInfo({super.key, required this.nombre, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            nombre,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            usuario,
            style: TextStyle(
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

  const EstadisticaItem({super.key, required this.numero, required this.etiqueta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numero,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(etiqueta, style: TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF5D5080),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Color(0xFFB39DDB), size: 18),
              Icon(Icons.star, color: Color(0xFFB39DDB), size: 18),
              Icon(Icons.star, color: Color(0xFFB39DDB), size: 18),
              Icon(Icons.star, color: Color(0xFFB39DDB), size: 18),
              Icon(Icons.star_border, color: Color(0xFFB39DDB), size: 18),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Una reseña de ejemplo.',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class SignButton extends StatelessWidget {
  final String buttonName;

  const SignButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white),
          backgroundColor: Color(0xFF8E24AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}