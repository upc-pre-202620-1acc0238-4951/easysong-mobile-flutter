import 'package:easy_song/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_song/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/home_ui_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetSongsUseCase useCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  HomeViewModel({
    required this.useCase,
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) {
    loadSongs();
  }

  HomeUiState _state = HomeUiState();
  HomeUiState get state => _state;

  Future<void> loadSongs() async {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();

    try {
      final List<Song> songs = await useCase.execute();
      final List<int> favoriteSongIds = await getFavoritesUseCase.execute();
      _state = _state.copyWith(
        songs: songs,
        favoriteSongIds: favoriteSongIds,
        errorMessage: null,
        isLoading: false,
      );
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _state.favoriteSongIds.contains(id);
  }

  Future<void> toggleFavorite(int id) async {
    try {
      await toggleFavoriteUseCase.execute(id, isFavorite(id));
      final List<int> favoriteSongIds = await getFavoritesUseCase.execute();
      _state = _state.copyWith(favoriteSongIds: favoriteSongIds);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString());
    }
    notifyListeners();
  }
}
