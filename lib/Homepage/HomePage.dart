import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:innovative_task/Constants/constant.dart';
import 'package:innovative_task/DetailScreen/detailScreen.dart';
import 'package:innovative_task/Homepage/Controller/homePageControlle.dart';
import 'package:innovative_task/Homepage/searchDelegate.dart';
import 'package:innovative_task/Model/TransactionModel.dart';

class HomePage extends StatelessWidget {
  final homepageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
          backgroundColor: darkblueColor,
          
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              showSearch(
                  context: context,
                  delegate: Searching(homepageController.transactionsList)); }
            , icon: Icon(Icons.search))
          ],
          title: Text(
            'Transactions',
            style: TextStyle(color: Colors.white),
          ),
          brightness: Brightness.light),
      body: SafeArea(
        child: Obx(()=>homepageController.isLoading.value ? Center(child: CircularProgressIndicator(color: darkblueColor,),) : Column(
          children: [
            SizedBox(height: 5,),
            
            Expanded(
              child: GroupedListView<TransactionModel, String>(
                  elements: homepageController.transactionsList,
                  useStickyGroupSeparators: true,
                  groupBy: (element) => element.date.toString(),
                  groupSeparatorBuilder: (String groupByValue) {
                    for (int i = 0;
                        i < homepageController.transactionsList.length;
                        i++) {
                      if (homepageController.transactionsList[i].date
                              .toString() ==
                          groupByValue) {
                        return UnconstrainedBox(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: darkblueColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                homepageController.transactionsList[i].date
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return Container();
                  },
                  itemBuilder: (context, element) => listTile(
                        element.type.toString(),
                        element.currencyCode.toString(),
                        element.date.toString(),
                        element.amount.toString(),
                        () {
                          Get.to(DetailViewScreen(
                              element.date.toString(),
                              element.amount.toString(),
                              element.currencyCode.toString(),
                              element.type.toString(),
                              element.bic.toString(),
                              element.description.toString(),
                              element.iban.toString()));
                        },
                      )),
            )
            
          ],
        ),
      ),)
    );
  }

  Widget listTile(String type, currency, date, amount, onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Card(
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
          trailing: Text('$amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: darkblueColor)),
        ),
      ),
    );
  }
}
