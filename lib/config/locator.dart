import 'package:base_flutter_provider_project/data/repositories/home_repo.dart';
import 'package:base_flutter_provider_project/utils/permission_handler.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() async {
  //not using locator.registerLazySingleton(() => NavigationService.getInstance());
  //locator.registerLazySingleton(() => SecureStorage.getInstance());
  locator.registerLazySingleton(() => PermissionHandler.getInstance());

  //repositories
  locator.registerFactory(() => HomeRepository());
  // final SharedPrefs sharedPrefs = await SharedPrefs.getInstance();
  // locator.registerSingleton(sharedPrefs);
}
