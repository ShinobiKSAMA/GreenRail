import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenrail/presenation/navigation_container.dart';
import 'package:greenrail/presenation/screens/home_screen.dart';
import 'package:greenrail/presenation/screens/my_account_screen.dart';
import 'package:greenrail/presenation/screens/my_booking_screen.dart';
import 'package:greenrail/presenation/screens/trains_result_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");
  final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shell");

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/trainsResult',
        name: 'Trains Result',
        builder: (context, state) => const TrainsResultScreen(),
      ),
      ShellRoute(
        observers: [HeroController()],
        parentNavigatorKey: rootNavigatorKey,
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => RootScreen(screen: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'Home',
            parentNavigatorKey: shellNavigatorKey,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/help',
            name: 'Help',
            parentNavigatorKey: shellNavigatorKey,
            builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Help'),
              ),
            ),
          ),
          GoRoute(
            path: '/myBookings',
            name: 'My Bookings',
            parentNavigatorKey: shellNavigatorKey,
            builder: (context, state) => const MyBookingScreen(),
          ),
          GoRoute(
            path: '/myAccount',
            name: 'My Account',
            parentNavigatorKey: shellNavigatorKey,
            builder: (context, state) => const MyAccountScreen(),
          ),
        ],
      ),
    ],
  );
  return router;
}
