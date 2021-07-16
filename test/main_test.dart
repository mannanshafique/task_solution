// Import the test package and Counter class
import 'package:innovative_task/Model/TransactionModel.dart';
import 'package:test/test.dart';

import 'transaction_list_test.dart';

void main() {
  // 1

  final mockapi = MockAPI();
  group('Given Transaction List Page Loads', () {
  test('Page should load a list of Transactions from Api', () async {
    // 1
    await mockapi.getData();
    // 2
    expect(mockapi.transactions.length, 2);
    // 3
    expect(mockapi.transactions[0].type, 'deposit');
    expect(mockapi.transactions[0].amount, '209.78');
    expect(mockapi.transactions[0].bic, 'OGKUKYJ1');
    expect(mockapi.transactions[0].currencyCode, 'XBA');
    expect(mockapi.transactions[0].date, '2021-07-05T00:34:29.993Z');
    expect(mockapi.transactions[0].iban, 'XK294190007255004009');
    expect(mockapi.transactions[0].id, '2');
    expect(mockapi.transactions[0].description, 'payment transaction at Hilpert, Emard and Denesik using card');
    
  });
});

}
