import 'dart:io';
import 'package:http/http.dart' as http;
void printUsage(){
  print("Get a job!");
}
Future<String>getWikipediaArticle(String articleTitle)async{
  final url=Uri.http(
    'en.wikipedia.org',//Wikipedia api domain
    '/api/rest_v1/page/summary/$articleTitle',//API path for article summary
  );
  final response = await http.get(url);
  if(response.statusCode==200){
    return response.body;
  }
  return 'Error:Failed to fetch ariticle: $articleTitle. Status code:${response.statusCode}';
}
void searchWikipedia(List<String>?arguments)async{
  final String?articleTitle;
  if(arguments==null || arguments.isEmpty){
    final inputFromStdin =stdin.readLineSync();
    if(inputFromStdin == null || inputFromStdin.isEmpty){
      print("No article title provided.Exiting");
      return;
    }
    articleTitle=inputFromStdin;
  }else{
    articleTitle= arguments.join('');

  }
  print("Are you looking for articles about $articleTitle? Please hold!");
  print("Here we go");
  print('(Brief json file)');
  var articleContent= await getWikipediaArticle(articleTitle);
  print(articleContent);
}
void main(List<String> arguments){
  if(arguments.isEmpty){
    printUsage();
  }
  else if(arguments.first=='wikipedia'){
    final inputArgs = arguments.length>1?arguments.sublist(1):null;
    searchWikipedia(inputArgs);
  }else{
    printUsage();
  }
  
}
