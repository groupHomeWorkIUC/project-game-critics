class ApiConstants {
  ApiConstants._();

  //base api url
  static const String apiUrl =
      'https://game-critic-project.azurewebsites.net/api';

  //games url
  static const String games = apiUrl + '/games';

  //news url
  static const String news = apiUrl + '/news';

  ///companies url
  static const String companies = apiUrl + '/companies';

  ///user constants
  static const String register = apiUrl + '/register';
  static const String login = apiUrl + '/login';
  static const String users = apiUrl + '/users';
  static const String comments = apiUrl + '/news-comments';
  static const String gameComments = apiUrl + '/game-comments';
}
