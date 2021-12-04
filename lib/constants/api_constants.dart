class ApiConstants {
  ApiConstants._();

  //base api url
  static const String apiUrl = 'http://127.0.0.1:8000/api';

  //games url
  static const String games = apiUrl + '/games';

  //news url
  static const String news = apiUrl + '/news';

  ///companies url
  static const String companies = apiUrl + '/companies';

  ///user constants
  static const String register = apiUrl + '/register';
  static const String login = apiUrl + '/login';
}
