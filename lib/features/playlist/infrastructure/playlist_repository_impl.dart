import 'package:easy_song/features/playlist/domain/playlist_repository.dart';
import 'package:easy_song/features/playlist/domain/playlist_song.dart';
import 'package:easy_song/features/playlist/infrastructure/playlist_api.dart';
import 'package:easy_song/features/playlist/infrastructure/playlist_song_dto.dart';

class PlaylistRepositoryImpl implements PlaylistRepository {
  final PlaylistApi _api;

  const new({required this._api});

  @override
  Future<List<PlaylistSong>> getPlaylistSongs() async {
    final List<PlaylistSongDto> dtos = await _api.getPlaylistSongs();
    return dtos
        .map(
          ((dto) => PlaylistSong(
            id: dto.id,
            title: dto.title,
            album: dto.album,
            image: dto.image,
          )),
        )
        .toList();
  }

  @override
  Future<void> togglePlaylistSong(int id) {
    throw UnimplementedError();
  }
}
