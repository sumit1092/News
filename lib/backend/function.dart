import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/components/search_Bar.dart';
import 'package:news/utils/key.dart';

Future <List>fetchdata() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey='+
          Key.key+
          '&q=' +
          SearchBar.searchcontroller.text)
  );
  Map result = jsonDecode(response.body);
  ('Fetched');
  return (result["articles"]);
}