import 'package:easy_song/features/favorites/domain/favorite_repository.dart';

class ToggleFavoriteUseCase {
  final FavoriteRepository repository;
  const new({required this.repository});

  Future<void> execute(int id, bool isFavorite) {
    if (isFavorite) {
      return repository.removeFavorite(id);
    }
    return repository.addFavorite(id);
  }
}
