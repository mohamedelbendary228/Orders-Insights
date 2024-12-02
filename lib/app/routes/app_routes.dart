part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String SPLASH = _Paths.SPLASH;
  static const String BOTTOM_NAV_BAR = _Paths.BOTTOM_NAV_BAR;
}

abstract class _Paths {
  _Paths._();

  static const String SPLASH = '/splash';
  static const String BOTTOM_NAV_BAR = '/bottom-nav-bar';
}
