import 'package:flutter/material.dart';
import 'package:clase_flutter/Screens/song_detail_screen.dart';

enum ExploreTab { canciones, artistas }

class Song {
  final String id;
  final String nombre;
  final String artista;
  final String genero;
  final String duracion;
  final String album;
  final String anio;
  final String reproducciones;
  final String descripcion;
  final String coverAsset;

  const Song({
    required this.id,
    required this.nombre,
    required this.artista,
    required this.genero,
    required this.duracion,
    required this.album,
    required this.anio,
    required this.reproducciones,
    required this.descripcion,
    required this.coverAsset,
  });
}

class ArtistItem {
  final String id;
  final String nombre;
  final int canciones;
  final String imageAsset;

  const ArtistItem({
    required this.id,
    required this.nombre,
    required this.canciones,
    required this.imageAsset,
  });
}

class _Colors {
  static const violetaClaro = Color(0xFFB39DDB);
  static const violetaApagado = Color(0xFF6E5A8E);
  static const azulcal = Color(0xFF4A8FBD);
  static const azul2 = Color(0xFF3A3756);
  static const vclaro = Color(0xFF5D5080);
  static const vclaroletra = Color(0xFFB39DDB);
  static const grisClaro = Color(0xFF7C7595);
  static const fondo = Color(0xFF4A3F6B);
}

const _generos = <String>[
  'Todos',
  'Electropop',
  'Synth-pop',
  'Synthwave',
  'Dream-pop',
  'Indie-pop',
];

const _mockSongs = <Song>[
  Song(
    id: 's1',
    nombre: 'The Nights',
    artista: 'Avicii',
    genero: 'Electropop',
    duracion: '3:43',
    album: 'Stories',
    anio: '2014',
    reproducciones: '1.5B',
    descripcion:
        'Tema emblemático de Avicii que invita a vivir el momento. Su letra es un homenaje al espíritu libre y a las noches inolvidables, acompañado de una producción luminosa y melodías que se quedan en la cabeza.',
    coverAsset: 'assets/drawable/runaway.jpg',
  ),
  Song(
    id: 's2',
    nombre: 'Levitating',
    artista: 'Dua Lipa',
    genero: 'Synth-pop',
    duracion: '3:23',
    album: 'Future Nostalgia',
    anio: '2020',
    reproducciones: '1.2B',
    descripcion:
        'Disco-pop pulido con sintetizadores brillantes y una base rítmica imposible de no bailar. Una de las canciones más reproducidas de la era post-2020.',
    coverAsset: 'assets/drawable/electricity.jpg',
  ),
  Song(
    id: 's3',
    nombre: 'Midnight City',
    artista: 'M83',
    genero: 'Synthwave',
    duracion: '4:03',
    album: "Hurry Up, We're Dreaming",
    anio: '2011',
    reproducciones: '500M',
    descripcion:
        'Himno generacional del synthwave moderno. Su solo de saxofón y atmósfera retro-futurista lo convirtieron en un clásico instantáneo.',
    coverAsset: 'assets/drawable/midnight_city.jpg',
  ),
  Song(
    id: 's4',
    nombre: 'Space Song',
    artista: 'Beach House',
    genero: 'Dream-pop',
    duracion: '5:21',
    album: 'Depression Cherry',
    anio: '2015',
    reproducciones: '300M',
    descripcion:
        'Pieza etérea de dream-pop con guitarras envolventes y voz susurrada. Un viaje sensorial perfecto para escuchar de noche.',
    coverAsset: 'assets/drawable/oblivion.jpg',
  ),
  Song(
    id: 's5',
    nombre: 'Nobody',
    artista: 'Mitski',
    genero: 'Indie-pop',
    duracion: '3:13',
    album: 'Be the Cowboy',
    anio: '2018',
    reproducciones: '150M',
    descripcion:
        'Una oda confesional a la soledad con un ritmo bailable que esconde una melancolía profunda. Mitski en su mejor forma.',
    coverAsset: 'assets/drawable/the_mother_we_share.png',
  ),
  Song(
    id: 's6',
    nombre: 'Blue Monday',
    artista: 'New Order',
    genero: 'Synth-pop',
    duracion: '7:29',
    album: 'Power, Corruption & Lies',
    anio: '1983',
    reproducciones: '200M',
    descripcion:
        'Pilar fundacional del synth-pop y la electrónica. Su línea de bajo y secuencia de batería siguen siendo referencia décadas después.',
    coverAsset: 'assets/drawable/clearest_blue.png',
  ),
];

const _mockArtists = <ArtistItem>[
  ArtistItem(
    id: 'a1',
    nombre: 'Avicii',
    canciones: 5,
    imageAsset: 'assets/drawable/personadosimagen.jpg',
  ),
  ArtistItem(
    id: 'a2',
    nombre: 'Dua Lipa',
    canciones: 12,
    imageAsset: 'assets/drawable/personatresimagen.png',
  ),
  ArtistItem(
    id: 'a3',
    nombre: 'M83',
    canciones: 8,
    imageAsset: 'assets/drawable/personacuatroimagen.jpg',
  ),
  ArtistItem(
    id: 'a4',
    nombre: 'Beach House',
    canciones: 1,
    imageAsset: 'assets/drawable/personacincoimagen.png',
  ),
  ArtistItem(
    id: 'a5',
    nombre: 'Mitski',
    canciones: 7,
    imageAsset: 'assets/drawable/personaseisimagen.jpg',
  ),
  ArtistItem(
    id: 'a6',
    nombre: 'New Order',
    canciones: 9,
    imageAsset: 'assets/drawable/pinguino.jpeg',
  ),
];

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  ExploreTab _selectedTab = ExploreTab.canciones;
  String _searchQuery = '';
  String _selectedGenero = 'Todos';

  List<Song> get _filteredSongs {
    final q = _searchQuery.trim().toLowerCase();
    return _mockSongs.where((s) {
      final matchesGenero =
          _selectedGenero == 'Todos' || s.genero == _selectedGenero;
      final matchesQuery = q.isEmpty ||
          s.nombre.toLowerCase().contains(q) ||
          s.artista.toLowerCase().contains(q);
      return matchesGenero && matchesQuery;
    }).toList();
  }

  List<ArtistItem> get _filteredArtists {
    final q = _searchQuery.trim().toLowerCase();
    return _mockArtists
        .where((a) => q.isEmpty || a.nombre.toLowerCase().contains(q))
        .toList();
  }

  void _onSongClick(Song song) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SongDetailScreen(song: song)),
    );
  }

  void _onArtistClick(ArtistItem artist) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Abrir perfil de ${artist.nombre}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Colors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            HeaderExplorerScreen(
              selectedTab: _selectedTab,
              searchQuery: _searchQuery,
              selectedGenero: _selectedGenero,
              onTabSelected: (tab) => setState(() => _selectedTab = tab),
              onSearchChanged: (v) => setState(() => _searchQuery = v),
              onGeneroSelected: (g) => setState(() => _selectedGenero = g),
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: BodyExplorerScreen(
                selectedTab: _selectedTab,
                songs: _filteredSongs,
                artists: _filteredArtists,
                onSongClick: _onSongClick,
                onArtistClick: _onArtistClick,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderExplorerScreen extends StatelessWidget {
  final ExploreTab selectedTab;
  final String searchQuery;
  final String selectedGenero;
  final ValueChanged<ExploreTab> onTabSelected;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onGeneroSelected;
  final VoidCallback onBack;

  const HeaderExplorerScreen({
    super.key,
    required this.selectedTab,
    required this.searchQuery,
    required this.selectedGenero,
    required this.onTabSelected,
    required this.onSearchChanged,
    required this.onGeneroSelected,
    required this.onBack,
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
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onBack,
                    child: Image.asset(
                      'assets/drawable/flechaizquierdaicono.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'Explorar Electropop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _TabButton(
                      texto: 'Canciones',
                      activo: selectedTab == ExploreTab.canciones,
                      onPressed: () => onTabSelected(ExploreTab.canciones),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _TabButton(
                      texto: 'Artistas',
                      activo: selectedTab == ExploreTab.artistas,
                      onPressed: () => onTabSelected(ExploreTab.artistas),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              BarraBusqueda(
                valorActual: searchQuery,
                onChanged: onSearchChanged,
              ),
              if (selectedTab == ExploreTab.canciones) ...[
                const SizedBox(height: 9),
                FiltroGeneros(
                  selectedGenero: selectedGenero,
                  onSelected: onGeneroSelected,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String texto;
  final bool activo;
  final VoidCallback onPressed;

  const _TabButton({
    required this.texto,
    required this.activo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white),
          backgroundColor: activo ? _Colors.azulcal : _Colors.azul2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

class BarraBusqueda extends StatelessWidget {
  final String valorActual;
  final ValueChanged<String> onChanged;
  final String placeholder;

  const BarraBusqueda({
    super.key,
    required this.valorActual,
    required this.onChanged,
    this.placeholder = 'Buscar...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _Colors.azul2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _Colors.violetaClaro),
      ),
      child: TextField(
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: valorActual,
            selection: TextSelection.collapsed(offset: valorActual.length),
          ),
        ),
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }
}

class FiltroGeneros extends StatelessWidget {
  final String selectedGenero;
  final ValueChanged<String> onSelected;

  const FiltroGeneros({
    super.key,
    required this.selectedGenero,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _generos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final genero = _generos[index];
          final activo = genero == selectedGenero;
          return OutlinedButton(
            onPressed: () => onSelected(genero),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              backgroundColor:
                  activo ? const Color(0xFF8E24AA) : _Colors.violetaApagado,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: Text(
              genero,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class BodyExplorerScreen extends StatelessWidget {
  final ExploreTab selectedTab;
  final List<Song> songs;
  final List<ArtistItem> artists;
  final ValueChanged<Song> onSongClick;
  final ValueChanged<ArtistItem> onArtistClick;

  const BodyExplorerScreen({
    super.key,
    required this.selectedTab,
    required this.songs,
    required this.artists,
    required this.onSongClick,
    required this.onArtistClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/backgroundplano.png',
            fit: BoxFit.cover,
          ),
        ),
        if (selectedTab == ExploreTab.canciones)
          _buildList(songs, (s) => SongCard(cancion: s, onTap: () => onSongClick(s)))
        else
          _buildList(
            artists,
            (a) => ArtistCard(artist: a, onTap: () => onArtistClick(a)),
          ),
      ],
    );
  }

  Widget _buildList<T>(List<T> items, Widget Function(T) builder) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No se encontraron resultados',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) => builder(items[i]),
    );
  }
}

class SongCard extends StatelessWidget {
  final Song cancion;
  final VoidCallback onTap;

  const SongCard({super.key, required this.cancion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _Colors.vclaro,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SongImage(assetPath: cancion.coverAsset),
            const SizedBox(width: 14),
            Expanded(child: SongContent(cancion: cancion)),
          ],
        ),
      ),
    );
  }
}

class SongImage extends StatelessWidget {
  final String assetPath;

  const SongImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _Colors.violetaClaro),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(assetPath, fit: BoxFit.cover),
      ),
    );
  }
}

class SongContent extends StatelessWidget {
  final Song cancion;

  const SongContent({super.key, required this.cancion});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          cancion.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Text(
          cancion.artista,
          style: const TextStyle(color: _Colors.vclaroletra, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            GenreTag(nombreGenero: cancion.genero),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                cancion.duracion,
                style: const TextStyle(
                  color: _Colors.vclaroletra,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GenreTag extends StatelessWidget {
  final String nombreGenero;

  const GenreTag({super.key, required this.nombreGenero});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _Colors.grisClaro,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: _Colors.violetaClaro),
      ),
      child: Text(
        nombreGenero,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class ArtistCard extends StatelessWidget {
  final ArtistItem artist;
  final VoidCallback onTap;

  const ArtistCard({super.key, required this.artist, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cancionesLabel =
        '${artist.canciones} canción${artist.canciones != 1 ? "es" : ""}';
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _Colors.vclaro,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArtistImage(assetPath: artist.imageAsset),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    artist.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cancionesLabel,
                    style: const TextStyle(
                      color: _Colors.vclaroletra,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArtistImage extends StatelessWidget {
  final String assetPath;

  const ArtistImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _Colors.violetaClaro, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(assetPath, fit: BoxFit.cover),
      ),
    );
  }
}
