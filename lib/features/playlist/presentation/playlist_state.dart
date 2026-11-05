import 'package:easy_song/features/playlist/domain/playlist_song.dart';

class PlaylistState {
  final List<PlaylistSong> songs;
  final bool isLoading;
  final String? errorMessage;

  new({this.songs = const [], this.isLoading = false, this.errorMessage});

  PlaylistState copyWith({
    List<PlaylistSong>? songs,
    List<int>? favoriteSongIds,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PlaylistState(
      songs: songs ?? this.songs,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
