import 'package:easy_song/core/app_database.dart';
import 'package:easy_song/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_song/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_song/features/favorites/domain/favorite_repository.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_dao.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_repository_impl.dart';
import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:easy_song/features/home/infrastructure/remote/song_api.dart';
import 'package:easy_song/features/home/infrastructure/song_repository_impl.dart';
import 'package:easy_song/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerSingletonAsync<Database>(
    () async => await getIt<AppDatabase>().database,
  );

  getIt.registerLazySingleton<FavoriteDao>(
    () => FavoriteDao(database: getIt<Database>()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(dao: getIt<FavoriteDao>()),
  );

  getIt.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<SongApi>(() => SongApi());

  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(api: getIt<SongApi>()),
  );
  getIt.registerLazySingleton<GetSongsUseCase>(
    () => GetSongsUseCase(repository: getIt<SongRepository>()),
  );
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      useCase: getIt<GetSongsUseCase>(),
      getFavoritesUseCase: getIt<GetFavoritesUseCase>(),
      toggleFavoriteUseCase: getIt<ToggleFavoriteUseCase>(),
    ),
  );
}
