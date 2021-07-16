class TransactionModel {
  String? date;
  String? amount;
  String? type;
  String? currencyCode;
  String? iban;
  String? description;
  String? bic;
  String? id;

  TransactionModel(
      {
      required this.date,
      required this.amount,
      required this.type,
      required this.currencyCode,
      required this.iban,
      required this.description,
      required this.bic,
      required this.id});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    type = json['type'];
    currencyCode = json['currencyCode'];
    iban = json['iban'];
    description = json['description'];
    bic = json['bic'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['currencyCode'] = this.currencyCode;
    data['iban'] = this.iban;
    data['description'] = this.description;
    data['bic'] = this.bic;
    data['id'] = this.id;
    return data;
  }
}
