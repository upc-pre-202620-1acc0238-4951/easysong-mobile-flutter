class PlaylistSongDto {
  final int id;
  final String title;
  final String album;
  final String image;

  const new({
    required this.id,
    required this.title,
    required this.album,
    required this.image,
  });

  factory PlaylistSongDto.fromJson(Map<String, dynamic> json) {
    return PlaylistSongDto(
      id: json['songId'],
      title: json['title'],
      album: json['album'],
      image: json['image'],
    );
  }
}
