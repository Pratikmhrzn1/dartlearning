import 'dart:io';
import 'package:http/http.dart' as http;
Future<String>getWikipediaArticle(String articleTitle)async{
  final url=Uri.http(
    'en.wikipedia.org',//Wikipedia api domain
    '/api/rest_v1/page/summary/$articleTitle',
  );
}
