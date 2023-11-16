// ignore_for_file: constant_identifier_names

enum NetworkRoutes {
  DEFAULT(''),
  LOGIN('api/login'),
  USER_DATA('api/users?page=2');

  final String rawValue;

  const NetworkRoutes(this.rawValue);
}
