class ApiLinks {
  static const String _baseUrl = 'https://reqres.in';
  static const String _baseUrlApi = '$_baseUrl/api';

  static String kUsersEndPoint(pageId) => '$_baseUrlApi/users?page=$pageId';
}
