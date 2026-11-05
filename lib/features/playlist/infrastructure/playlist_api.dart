import 'dart:convert';
import 'dart:io';

import 'package:easy_song/core/storage/token_storage.dart';
import 'package:easy_song/features/playlist/infrastructure/playlist_song_dto.dart';
import 'package:http/http.dart' as http;

class PlaylistApi {
  final TokenStorage _storage;

  const new({required this._storage});

  final String url =
      'https://songapi-fcbahjbha7dabkan.eastus-01.azurewebsites.net/api/playlists';

  Future<List<PlaylistSongDto>> getPlaylistSongs() async {
    final Uri uri = Uri.parse(url);
    String? token = await _storage.getToken();
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      List jsons = json['results'];
      return jsons.map(((e) => PlaylistSongDto.fromJson(e))).toList();
    }

    throw Exception('Failed to load playlist');
  }
}
