import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_task/Api/api_integrate.dart';
import 'package:innovative_task/Model/TransactionModel.dart';

class HomePageController extends GetxController with WidgetsBindingObserver {
  RxList<TransactionModel> transactionsList = <TransactionModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getDataFromApi();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getDataFromApi() async {
    FetchingApi fetchCategory = FetchingApi();
    await fetchCategory.getData();
    var fetch = fetchCategory.transactions;
    transactionsList.value = fetch;
    isLoading.value = false;
    update();
  }
}
