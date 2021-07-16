import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:innovative_task/Constants/constant.dart';
import 'package:innovative_task/CurrencyCode/currencyCode.dart';
import 'package:innovative_task/Model/TransactionModel.dart';
import 'package:intl/intl.dart';

class FetchingApi {
  List<TransactionModel> transactions = [];
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  Future<void> getData() async {
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    //!
    var amountWithCode;
    amountWithCodeCompile(String currencyCode) {
      amountWithCode = CurrencyCodeMapping().messageCode.keys.firstWhere(
          (k) => CurrencyCodeMapping().messageCode[k] == currencyCode,
          orElse: () {
        return 'Nothing';
      });
    }

    
    //!
    try {
      jsonData.forEach((element) {
        amountWithCodeCompile(element['currencyCode']);
        DateTime dateTime = DateTime.parse(element['date']);
        final String formattedDate = formatter.format(dateTime);
        
        TransactionModel transactionModel = TransactionModel(
            id: element['id'],
            amount: element['amount']+' -/ '+amountWithCode,
            bic: element['bic'],
            currencyCode: element['currencyCode'],
            date: formattedDate,
            description: element['description'],
            iban: element['iban'],
            type: element['type']);
        transactions.add(transactionModel);
      });
    } catch (e) {
      print(e);
    }
  }
}
