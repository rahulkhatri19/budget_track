import 'package:budget_track/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import 'createRecordUI.dart';

class CreateRecord extends StatefulWidget{
  const CreateRecord({super.key});

  @override
  State<CreateRecord> createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {

  final addNoteTxt = TextEditingController();
  final addAmountTxt = TextEditingController();
  RxString timePicked = "".obs;
  RxString datePicked = DateFormat(Constant.recordDateFormat).format(DateTime.now()).toString().obs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {

            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              color: Colors.black,
              onPressed: () {

              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("Income"),),
              Tab(child: Text("Expense"),),
              Tab(child: Text("Transfer"),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            incomeTab(),
            expenseTab(),
            transferTab(),
          ],
        ),
      ),
    );
  }

  Widget incomeTab(){
    return Column(
      children: [
        Icon(Icons.check),
        Icon(Icons.close)
      ],
    );
  }
  Widget expenseTab(){
    return Column(
      children: [
        accountCategory(),
        addNote(addNoteTxt),
        dateTime(context, datePicked, timePicked),
        amountUI(addAmountTxt),
        numberCalculation()
      ],
    );
  }
  Widget transferTab(){
    return Column(
      children: [
        Icon(Icons.chair),
        Icon(Icons.close)
      ],
    );
  }
}
