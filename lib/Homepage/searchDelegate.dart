import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_task/DetailScreen/detailScreen.dart';
import 'package:innovative_task/Model/TransactionModel.dart';

class Searching extends SearchDelegate<TransactionModel> {
  List<TransactionModel> items;
  Searching(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Get.back();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? items
        : items
            .where((p) => p.type!.toUpperCase().startsWith(query.toUpperCase()))
            .toList();

    return searchlist.isEmpty
        ? Padding(
            padding: EdgeInsets.only(left: 70, top: 25),
            child: Text(
              'No item Found',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          )
        : ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              return listTile(
                  searchlist[index].type.toString(),
                  searchlist[index].currencyCode,
                  searchlist[index].date,
                  searchlist[index].amount, () {
                Get.to(DetailViewScreen(
                    searchlist[index].date.toString(),
                    searchlist[index].amount.toString(),
                    searchlist[index].currencyCode.toString(),
                    searchlist[index].type.toString(),
                    searchlist[index].bic.toString(),
                    searchlist[index].description.toString(),
                    searchlist[index].iban.toString()));
              });
            });
  }

  Widget listTile(String type, currency, date, amount, onTap) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        title: Text(
          '${type[0].toUpperCase()}${type.substring(1)}',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
        trailing: Text(amount,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
