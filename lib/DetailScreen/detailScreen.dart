import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:innovative_task/Constants/constant.dart';
import 'package:intl/intl.dart';

class DetailViewScreen extends StatelessWidget {
  final String date;
  final String amount;
  final String type;
  final String currencyCode;
  final String iban;
  final String description;
  final String bic;

  DetailViewScreen(this.date, this.amount, this.currencyCode, this.type,
      this.bic, this.description, this.iban);
  @override
  Widget build(BuildContext context) {
    //!

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Transaction Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [],
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: darkblueColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.22,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: darkblueColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        'Type :',
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: Colors.white),
                        1),
                    text(
                      '${type[0].toUpperCase()}${type.substring(1)}',
                      TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white),
                      1,
                    ),
                    sizedBox(4),
                    row([
                      text(
                          'Currency Code :',
                          TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal,color: Colors.white),
                          1),
                      text(
                          'Amount :',
                          TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal,color: Colors.white),
                          1),
                    ]),
                    row([
                      text(
                          '$currencyCode',
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                          1),
                      Container(
                       
                        child: text(
                            '$amount',
                            TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                            1),
                      )
                    ]),
                    sizedBox(4),
                    text(
                        'Date :',
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: Colors.white),
                        1),
                    text(
                        '$date',
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                        1),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                    'Details',
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkblueColor), //! Detail COlor
                    1),
                sizedBox(8),
                text(
                    description,
                    TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    5),
                sizedBox(8),
                text(
                    'Information',
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkblueColor),
                    1),
                sizedBox(8),
                text('IBAN :',
                    TextStyle(fontSize: 14, fontWeight: FontWeight.normal), 1),
                text(
                    iban,
                    TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    1),
                sizedBox(8),
                text('BIC :',
                    TextStyle(fontSize: 14, fontWeight: FontWeight.normal), 1),
                text(
                    bic,
                    TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    1),
              ],
            ),
          ),
        ],
      ))),
    );
  }

  Widget text(String text, TextStyle style, int lines) {
    return Text(
      text,
      style: style,
      maxLines: lines,
    );
  }

  Widget sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget row(List<Widget> widget) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: widget);
  }
}
