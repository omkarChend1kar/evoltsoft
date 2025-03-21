import 'package:evoltsoft/src/core/common/routes/go_router.dart';
import 'package:evoltsoft/src/core/common/services/service_locator.dart';
import 'package:evoltsoft/src/core/common/settings/settings_controller.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/presentation/cubit/getnearbystations/getnearbystations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EvoltSoftApp extends StatelessWidget {
  const EvoltSoftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetNearByStationsCubit>()),
      ],
      child: AnimatedBuilder(
        animation: getIt<Settings>(),
        builder: (context, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: getIt<Settings>().themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF0CCB3F),
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF0CCB3F),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            routerConfig: goRouter(),
          );
        },
      ),
    );
  }
}

