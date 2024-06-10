import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key, required this.screen});

  final Widget screen;

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _goToPage(int value, int selected) {
    if (value != selected) {
      setState(() => _selectedIndex = value);
      GoRouter.of(context).go(Pages.values[value].location);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => _goToPage(value, _selectedIndex),
        elevation: 1,
        destinations: List.generate(
          4,
          (index) => NavigationDestination(
            icon: Icon(Pages.values[index].icon),
            label: Pages.values[index].name(context),
          ),
        ),
      ),
      body: widget.screen,
    );
  }
}

enum Pages {
  home(CupertinoIcons.home, '/home'),
  bookings(CupertinoIcons.square_list_fill, '/myBookings'),
  help(CupertinoIcons.question_square_fill, '/help'),
  account(CupertinoIcons.profile_circled, '/myAccount'),
  ;

  final IconData icon;
  final String location;

  const Pages(this.icon, this.location);

  String name(BuildContext _) => switch (this) {
        Pages.home => "Home",
        Pages.bookings => "My Bookings",
        Pages.help => "Help",
        Pages.account => "My Account",
      };
}
