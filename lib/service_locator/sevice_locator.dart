import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/local_storage/domain/repository_interfaces/local_storage_repo_intf.dart';
import '../utils/local_storage/infrastructure/data_source/interfaces/local_storage_data_source_intf.dart';
import '../utils/local_storage/infrastructure/data_source/local_storage_data_source.dart';
import '../utils/local_storage/infrastructure/repositories/local_storage_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Repositories.
  // LocalStorageRepo
  sl.registerLazySingleton<LocalStorageRepoIntf>(
    () => LocalStorageRepo(localStorageDataSource: sl()),
  );

  // Data Sources.
  // LocalStorageDataSource
  sl.registerLazySingleton<LocalStorageDataSourceIntf>(
    () => LocalStorageDataSource(sharedPreferences: sl()),
  );

  // Third-part libraries/packages.
  // SharedPreferences.
  sl.registerLazySingletonAsync(() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences;
  });
}
