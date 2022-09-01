import 'package:clean_architecture_nasa/core/http_client/http_client.dart';
import 'package:clean_architecture_nasa/core/http_client/http_implementation.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:clean_architecture_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:clean_architecture_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:clean_architecture_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_architecture_nasa/features/presentation/stores/home_store.dart';
import 'package:clean_architecture_nasa/features/presentation/stores/space_media_store.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // Http
    getIt.registerLazySingleton<HttpClient>(() => HttpImplementation());
    // Datasources
    getIt.registerLazySingleton<SpaceMediaDatasource>(
        () => SpaceMediaDatasourceImplementation(getIt()));
    // Repositories
    getIt.registerLazySingleton<SpaceMediaRepository>(
        () => SpaceMediaRepositoryImplementation(getIt()));
    // Usecases
    getIt.registerSingleton<GetSpaceMediaFromDateUsecase>(
        GetSpaceMediaFromDateUsecase(getIt()));
    // Stores (Controllers)
    getIt.registerFactory<SpaceMediaStore>(() => SpaceMediaStore(getIt()));
    getIt.registerFactory<HomeStore>(() => HomeStore());
  }
}
