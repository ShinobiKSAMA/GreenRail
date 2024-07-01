import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenrail/presenation/navigation_container.dart';
import 'package:greenrail/presenation/screens/home_screen.dart';
import 'package:greenrail/presenation/screens/my_account_screen.dart';
import 'package:greenrail/presenation/screens/my_booking_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        observers: [HeroController()],
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => RootScreen(screen: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'Home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/help',
            name: 'Help',
            builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text('Help'),
              ),
            ),
          ),
          GoRoute(
            path: '/myBookings',
            name: 'My Bookings',
            builder: (context, state) => const MyBookingScreen(),
          ),
          GoRoute(
            path: '/myAccount',
            name: 'My Account',
            builder: (context, state) => const MyAccountScreen(),
          ),
        ],
      ),
    ],
  );
  return router;
}
