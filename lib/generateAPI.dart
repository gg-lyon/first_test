import 'package:flutter_first_test/NumberOutput.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<NumberOutput> fetchNumberGenerator() async {
  final response = await http.get('https://csrng.net/csrng/csrng.php?min=1&max=1000');

  if (response.statusCode == 200) {

    return NumberOutput.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load album');
  }
}
/*Future<http.Response> fetchNumberGenerator() {

  return http.get('https://csrng.net/csrng/csrng.php?min=1&max=1000');
}*/