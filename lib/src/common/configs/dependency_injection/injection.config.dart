// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

import '../../../features/core/flavors/flavor_config.dart' as _i4;
import '../../../features/core/flavors/impl/dev_flavor_config.dart' as _i5;
import '../../../features/templates_ui/ticket_challenge/domain/usecase/fetch_events_usecase.dart'
    as _i14;
import '../../../features/templates_ui/ticket_challenge/domain/usecase/get_event_by_id_usecase.dart'
    as _i16;
import '../../../features/templates_ui/ticket_challenge/domain/usecase/impl/dev_fetch_events_usecase.dart'
    as _i15;
import '../../../features/templates_ui/ticket_challenge/domain/usecase/impl/dev_get_event_by_id_usecase.dart'
    as _i17;
import '../../../features/templates_ui/ticket_challenge/infrastructure/data_sources/event_remote_data_provider.dart'
    as _i10;
import '../../../features/templates_ui/ticket_challenge/infrastructure/data_sources/impl/dev_event_remote_data_provider.dart'
    as _i11;
import '../../../features/templates_ui/ticket_challenge/infrastructure/repositories/event_repository.dart'
    as _i12;
import '../../../features/templates_ui/ticket_challenge/infrastructure/repositories/impl/dev_event_repository.dart'
    as _i13;
import '../../../routers/page_config.dart' as _i9;
import '../../widgets/app_bloc_observer/app_bloc_observer.dart' as _i8;
import 'register_modules/dio_module.dart' as _i18;
import 'register_modules/hive_module.dart' as _i19;
import 'register_modules/logger_module.dart' as _i20;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final hiveModule = _$HiveModule();
  final loggerModule = _$LoggerModule();
  gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
  gh.singleton<_i4.FlavorConfig>(_i5.DevFlavorConfig(),
      registerFor: {_dev, _test});
  await gh.lazySingletonAsync<_i6.HiveInterface>(() => hiveModule.hive,
      preResolve: true);
  gh.singleton<_i7.Logger>(loggerModule.logger);
  gh.factory<_i8.AppBlocObserver>(
      () => _i8.AppBlocObserver(logger: get<_i7.Logger>()));
  await gh.lazySingletonAsync<_i6.Box<_i9.PageConfig>>(
      () => hiveModule.pageConfigEntityBox(get<_i6.HiveInterface>()),
      preResolve: true);
  gh.singleton<_i10.EventRemoteDataProvider>(
      _i11.DevEventRemoteDataProvider(
          config: get<_i4.FlavorConfig>(), dio: get<_i3.Dio>()),
      registerFor: {_dev, _test});
  gh.singleton<_i12.EventRepository>(
      _i13.DevEventRepository(
          eventRemoteDataProvider: get<_i10.EventRemoteDataProvider>()),
      registerFor: {_dev, _test});
  gh.singleton<_i14.FetchEventsUseCase>(
      _i15.DevFetchEventsUseCase(repository: get<_i12.EventRepository>()),
      registerFor: {_dev, _test});
  gh.singleton<_i16.GetEventByIdUseCase>(
      _i17.DevGetEventByIdUseCase(repository: get<_i12.EventRepository>()),
      registerFor: {_dev, _test});
  return get;
}

class _$DioModule extends _i18.DioModule {}

class _$HiveModule extends _i19.HiveModule {}

class _$LoggerModule extends _i20.LoggerModule {}
