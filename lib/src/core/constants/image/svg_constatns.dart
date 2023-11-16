class SVGImageConstants {
  static SVGImageConstants? _instace;

  static SVGImageConstants get instance =>
      _instace ??= SVGImageConstants._init();

  SVGImageConstants._init();
  //splash logo
  String get splashLogo => toSvg("splash_logo");

  String toSvg(String name) => 'assets/images/$name.svg';
}
