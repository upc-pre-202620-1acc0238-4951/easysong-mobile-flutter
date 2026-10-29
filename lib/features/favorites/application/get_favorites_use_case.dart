import 'package:easy_song/features/favorites/domain/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  const new({required this.repository});

  Future<List<int>> execute() async {
    return await repository.getFavorites();
  }
}
