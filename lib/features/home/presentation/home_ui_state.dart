import 'package:easy_song/features/home/domain/song.dart';

class HomeUiState {
  final List<Song> songs;
  final List<int> favoriteSongIds;
  final bool isLoading;
  final String? errorMessage;

  const HomeUiState({
    this.songs = const [],
    this.favoriteSongIds = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HomeUiState copyWith({
    List<Song>? songs,
    List<int>? favoriteSongIds,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeUiState(
      songs: songs ?? this.songs,
      favoriteSongIds: favoriteSongIds ?? this.favoriteSongIds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
