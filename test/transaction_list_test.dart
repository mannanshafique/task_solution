import 'package:innovative_task/Api/api_integrate.dart';
import 'package:innovative_task/Model/TransactionModel.dart';

class MockAPI extends FetchingApi {
  @override
  Future<List<TransactionModel>> getData() {
    return Future.value([
      TransactionModel(
          id: '1',
          amount: '209.78',
          bic: 'JBFEMWP1745',
          currencyCode: 'XBD',
          date: '2021-07-05T00:34:29.993Z',
          description:
              'payment transaction at Hilpert, Emard and Denesik using card',
          iban: 'IE53624A00844716683079',
          type: 'withdrawal'),
      TransactionModel(
          id: '2',
          amount: '209.78',
          bic: 'OGKUKYJ1',
          currencyCode: 'XBA',
          date: '2021-07-05T00:34:29.993Z',
          description:
              'payment transaction at Hilpert, Emard and Denesik using card',
          iban: 'XK294190007255004009',
          type: 'deposit'),
    ]);
  }
}
