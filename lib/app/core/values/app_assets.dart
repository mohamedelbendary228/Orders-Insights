const String _kAssets = "assets/";
const String _kImages = "${_kAssets}images/";
const String _kSvgImages = "${_kAssets}images/svg/";

class AppAssets {
  const AppAssets._();

  /// .SVG --------------------------------------------------------
  static const String splashLogo = "${_kSvgImages}flapkap_logo.svg";
  static const String appIcon = "${_kSvgImages}app_icon.svg";
  static const String cartIco = "${_kSvgImages}cart_icon.svg";
  static const String chartIcon = "${_kSvgImages}chart.svg";

  /// .PNG --------------------------------------------------------
  static const String appBarHeader = "${_kImages}header.png";
}
