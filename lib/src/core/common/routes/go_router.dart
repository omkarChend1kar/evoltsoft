import 'package:evoltsoft/src/core/common/pages/evoltsoft_not_available_page.dart';
import 'package:evoltsoft/src/core/common/widgets/evoltsoft_dashboard_shell.dart';
import 'package:evoltsoft/src/core/common/widgets/evoltsoft_transition_page.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/presentation/pages/evoltsoft_nearby_charging_stations_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() => GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => EvoltsoftNearbyChargingStationsPage.route,
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return EvoltsoftDashboardShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(
            debugLabel: 'charging_stations_nearby',
          ),
          routes: [
            GoRoute(
              path: EvoltsoftNearbyChargingStationsPage.route,
              pageBuilder: (context, state) {
                return TransitionPage(
                  key: state.pageKey,
                  child: EvoltsoftNearbyChargingStationsPage(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'stations'),
          routes: [
            GoRoute(
              path: EvoltsoftNotAvailablePage.route,
              pageBuilder: (context, state) {
                return TransitionPage(
                  key: state.pageKey,
                  child: EvoltsoftNotAvailablePage(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'history'),
          routes: [
            GoRoute(
              path: EvoltsoftNotAvailablePage.route,
              pageBuilder: (context, state) {
                return TransitionPage(
                  key: state.pageKey,
                  child: EvoltsoftNotAvailablePage(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
          routes: [
            GoRoute(
              path: EvoltsoftNotAvailablePage.route,
              pageBuilder: (context, state) {
                return TransitionPage(
                  key: state.pageKey,
                  child: EvoltsoftNotAvailablePage(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    return null;
  },
);
