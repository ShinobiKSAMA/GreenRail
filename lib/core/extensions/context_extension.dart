import 'package:flutter/material.dart';

extension ContextEx<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  Future<T?> showModal(
    Widget screen, {
    bool isScaffold = false,
    bool showDrag = true,
  }) {
    return showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: showDrag,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: this,
      builder: (context) => isScaffold
          ? SafeArea(child: screen)
          : AnimatedPadding(
              duration: const Duration(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SafeArea(child: screen),
            ),
    );
  }

  Future<T?> showSmallModal(Widget screen) {
    return showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      context: this,
      builder: (context) => SafeArea(child: screen),
    );
  }
}
