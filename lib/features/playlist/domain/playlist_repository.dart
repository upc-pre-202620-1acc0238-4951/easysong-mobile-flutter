import 'package:easy_song/features/playlist/domain/playlist_song.dart';

abstract class PlaylistRepository {

  Future<List<PlaylistSong>> getPlaylistSongs();

  Future<void> togglePlaylistSong(int id);
}