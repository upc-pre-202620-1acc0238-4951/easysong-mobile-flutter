import 'package:easy_song/features/playlist/domain/playlist_repository.dart';
import 'package:easy_song/features/playlist/domain/playlist_song.dart';

class GetPlaylistSongsUseCase {
  final PlaylistRepository _repository;

  const new({required this._repository});

  Future<List<PlaylistSong>> execute() {
    return _repository.getPlaylistSongs();
  }
}
