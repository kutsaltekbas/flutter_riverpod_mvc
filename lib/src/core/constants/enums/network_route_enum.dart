// ignore_for_file: constant_identifier_names

enum NetworkRoutes {
  DEFAULT(''),
  LOGIN('https://reqres.in/api/login'),
  USER_DATA('https://reqres.in/api/users?page=1');

  final String rawValue;

  const NetworkRoutes(this.rawValue);
}
