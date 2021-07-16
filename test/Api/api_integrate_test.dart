import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:innovative_task/Constants/constant.dart';
import 'package:innovative_task/Model/TransactionModel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  Future<http.Response> fetchTransaction(http.Request request) async {
  final response =
      await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    
    return jsonDecode(response.body);
  } else {
    
    throw Exception('Failed to load album');
  }
}
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient(fetchTransaction);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response('{"date": "2021-07-05T00:34:29.993Z","amount": "209.78","type": "withdrawal","currencyCode": "XBD","iban": "IE53624A00844716683079","description": "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284","bic": "JBFEMWP1745","id": "1"}', 200));

      expect(await fetchTransaction(http.Request('', Uri.parse(apiUrl))), isA<TransactionModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient(fetchTransaction);

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchTransaction(http.Request('', Uri.parse(apiUrl))), throwsException);
    });
  });
}