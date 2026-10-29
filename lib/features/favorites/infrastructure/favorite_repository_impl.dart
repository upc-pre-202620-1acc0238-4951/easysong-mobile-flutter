import 'package:easy_song/features/favorites/domain/favorite_repository.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_dao.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDao dao;

  const new({required this.dao});

  @override
  Future<List<int>> getFavorites() async {
    return await dao.getFavorites();
  }

  @override
  Future<void> addFavorite(int id) async {
    dao.addFavorite(id);
  }

  @override
  Future<void> removeFavorite(int id) async {
    dao.removeFavorite(id);
  }
}
