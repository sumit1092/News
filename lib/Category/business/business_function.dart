import 'dart:convert';
import 'package:http/http.dart' as http;

Future <List>business() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1d79cae5264846fb81244da4d54a87d9')
  );
  Map result = jsonDecode(response.body);
  ('Fetched');
  return (result["articles"]);
}