import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpClient {
  final client = http.Client();

  Future<Response> get({required String url}) {
    return client.get(Uri.parse(url));
  }
}
