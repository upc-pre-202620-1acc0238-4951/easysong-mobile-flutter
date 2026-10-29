import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/home_view_model.dart';
import 'package:easy_song/features/home/presentation/song_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: viewModel.state.songs.length,
          itemBuilder: (context, index) {
            final Song song = viewModel.state.songs[index];
            return SongCard(
              song: song,
              isFavorite: viewModel.isFavorite(song.id),
              onToggleFavorite: () {
                viewModel.toggleFavorite(song.id);
              },
            );
          },
        );
      },
    );
  }
}
