import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:easy_song/features/home/infrastructure/remote/song_api.dart';
import 'package:easy_song/features/home/infrastructure/song_repository_impl.dart';
import 'package:easy_song/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {

  getIt.registerLazySingleton<SongApi>(() => SongApi());

  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(api: getIt<SongApi>()),
  );
  getIt.registerLazySingleton<GetSongsUseCase>(
    () => GetSongsUseCase(repository: getIt<SongRepository>()),
  );
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(useCase: getIt<GetSongsUseCase>()),
  );
}
