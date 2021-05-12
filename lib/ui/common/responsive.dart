import 'package:flutter/material.dart';

const _kTabletMinWidth = 650.0;
const _kDesktopMinWidth = 1100.0;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _kTabletMinWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _kDesktopMinWidth &&
      MediaQuery.of(context).size.width >= _kTabletMinWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _kDesktopMinWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= _kDesktopMinWidth) {
          return desktop;
        }
        return mobile;
      },
    );
  }
}
