// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/chargerdetails/presentation/cubit/chargerdetails_cubit.dart'
    as _i1064;
import '../../../features/chargerdiscovery/data/repositories/charger_discovery_repository_impl.dart'
    as _i412;
import '../../../features/chargerdiscovery/domain/repositories/charger_discovery_repository.dart'
    as _i302;
import '../../../features/chargerdiscovery/domain/usecases/get_nearby_chargers_usecase.dart'
    as _i548;
import '../../../features/chargerdiscovery/domain/usecases/search_chargers_usecase.dart'
    as _i433;
import '../../../features/chargerdiscovery/presentation/cubit/getnearbystations/getnearbystations_cubit.dart'
    as _i824;
import '../../../features/onboarding/data/datasources/remote/onboarding_remote_datasource.dart'
    as _i501;
import '../../../features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i638;
import '../../../features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i601;
import '../../../features/onboarding/domain/usecases/create_account_usecase.dart'
    as _i955;
import '../../../features/onboarding/domain/usecases/login_usecase.dart'
    as _i807;
import '../../../features/onboarding/presentation/cubit/createaccount/createaccount_cubit.dart'
    as _i591;
import '../../../features/onboarding/presentation/cubit/login/login_cubit.dart'
    as _i199;
import '../../utills/module/register_module.dart' as _i937;
import '../../utills/network/dio_provider.dart' as _i458;
import '../../utills/network/network_info.dart' as _i367;
import '../settings/settings_controller.dart' as _i719;
import '../settings/settings_service.dart' as _i563;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i59.FirebaseAuth>(() => registerModule.auth);
    gh.factory<_i458.DioProvider>(() => registerModule.dioProvider);
    gh.factory<_i1064.ChargerDetailsCubit>(() => _i1064.ChargerDetailsCubit());
    gh.factory<_i199.LoginCubit>(() => _i199.LoginCubit());
    gh.singleton<_i563.SettingsService>(() => _i563.SettingsService());
    gh.singleton<_i719.Settings>(
      () => _i719.SettingsController(gh<_i563.SettingsService>()),
    );
    gh.singleton<_i501.OnboardingRemoteDataSource>(
      () => _i501.OnboardingRemoteDatasourceImpl(auth: gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i367.NetworkInfo>(
      () => _i367.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.singleton<_i302.ChargerDiscoveryRepository>(
      () => _i412.ChargerDiscoveryRepositoryImpl(
        networkInfo: gh<_i367.NetworkInfo>(),
      ),
    );
    gh.singleton<_i601.OnboardingRepository>(
      () => _i638.OnboardingRepositoryImpl(
        remoteDataSource: gh<_i501.OnboardingRemoteDataSource>(),
        networkInfo: gh<_i367.NetworkInfo>(),
      ),
    );
    gh.factory<_i548.GetNearbyChargersUsecase>(
      () => _i548.GetNearbyChargersUsecaseImpl(
        chargerDiscoveryRepository: gh<_i302.ChargerDiscoveryRepository>(),
      ),
    );
    gh.factory<_i433.SearchChargersUsecase>(
      () => _i433.SearchChargersUsecaseImpl(
        chargerDiscoveryRepository: gh<_i302.ChargerDiscoveryRepository>(),
      ),
    );
    gh.factory<_i824.GetNearByStationsCubit>(
      () => _i824.GetNearByStationsCubit(gh<_i548.GetNearbyChargersUsecase>()),
    );
    gh.singleton<_i807.LoginUsecase>(
      () => _i807.LoginUsecaseImpl(
        onboardingRepository: gh<_i601.OnboardingRepository>(),
      ),
    );
    gh.singleton<_i955.CreateAccountUsecase>(
      () => _i955.CreateAccountUsecaseImpl(
        onboardingRepository: gh<_i601.OnboardingRepository>(),
      ),
    );
    gh.factory<_i591.CreateAccountCubit>(
      () => _i591.CreateAccountCubit(gh<_i955.CreateAccountUsecase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i937.RegisterModule {}
