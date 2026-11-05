import 'package:easy_song/features/playlist/application/get_playlist_songs_use_case.dart';
import 'package:easy_song/features/playlist/domain/playlist_song.dart';
import 'package:easy_song/features/playlist/presentation/playlist_state.dart';
import 'package:flutter/material.dart';

class PlaylistViewModel extends ChangeNotifier {
  final GetPlaylistSongsUseCase _getPlaylistSongs;

  new({required this._getPlaylistSongs}) {
    getPlaylistSongs();
  }

  PlaylistState _state = PlaylistState();
  PlaylistState get state => _state;

  Future<void> getPlaylistSongs() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    try {
      List<PlaylistSong> songs = await _getPlaylistSongs.execute();
      _state = _state.copyWith(songs: songs, isLoading: false);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }
}
