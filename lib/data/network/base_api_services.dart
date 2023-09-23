abstract class BaseApiServices {
  // template untuk perintah api (get, post, put, delete)
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(dynamic data, String url);
}
