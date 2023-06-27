import 'package:dialog_service/dialog_service.dart';
import 'package:get_it/get_it.dart';

abstract class Dependency {
  static final getIt = GetIt.instance;
  Dependency._();

  static void init() {
    getIt.registerLazySingleton(() => AlertServiceImpl());
    getIt.registerLazySingleton(
        () => AlertServiceSystemBackInterceptionAwareImpl());
    getIt.registerLazySingleton(() => BottomSheetServiceImpl());
  }
}

AlertService get alertService => Dependency.getIt<AlertServiceImpl>();
AlertService get systemBackAwareAlertService =>
    Dependency.getIt<AlertServiceSystemBackInterceptionAwareImpl>();
BottomSheetService get bottomSheetService =>
    Dependency.getIt<BottomSheetServiceImpl>();
