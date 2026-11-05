import 'package:easy_song/features/playlist/presentation/playlist_view_model.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final PlaylistViewModel _viewModel;
  const new({super.key, required this._viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return ListView.builder(
          itemCount: _viewModel.state.songs.length,
          itemBuilder: (context, index) =>
              Text(_viewModel.state.songs[index].title),
        );
      },
    );
  }
}
