import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/song_detail_page.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
    required this.isFavorite,
    required this.onToggleFavorite,
  });
  final bool isFavorite;
  final Song song;
  final void Function() onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SongDetailPage(song: song)),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: song.id,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      song.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topEnd,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: ClipOval(
                          child: Container(
                            color: Theme.of(context).colorScheme.surface,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          onToggleFavorite();
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    song.artist,
                    style: Theme.of(context).textTheme.bodySmall,
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
