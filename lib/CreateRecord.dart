import 'package:budget_track/localDb/database_repository.dart';
import 'package:budget_track/localDb/expenseDbModel.dart';
import 'package:budget_track/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import 'createRecordUI.dart';

class CreateRecord extends StatefulWidget {
  const CreateRecord({super.key});

  @override
  State<CreateRecord> createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
  final addNoteTxt = TextEditingController();
  final addAmountTxt = TextEditingController();
  RxString timePicked = "".obs;
  RxString datePicked = DateFormat(Constant.recordDateFormat)
      .format(DateTime.now())
      .toString()
      .obs;

  @override
  Widget build(BuildContext context) {
    timePicked = TimeOfDay.now().format(context).obs;
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              getExpanse();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              color: Colors.black,
              onPressed: () {
                addExpense();
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Income"),
              ),
              Tab(
                child: Text("Expense"),
              ),
              Tab(
                child: Text("Transfer"),
              ),
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

  Widget incomeTab() {
    return const Column(
      children: [Icon(Icons.check), Icon(Icons.close)],
    );
  }

  Widget expenseTab() {
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

  Widget transferTab() {
    return Column(
      children: [Icon(Icons.chair), Icon(Icons.close)],
    );
  }

  void addExpense() async {
    ExpenseDbModel expenseDbModel = ExpenseDbModel(
        account: 'Online Food',
        category: 'Food & Drink',
        expenseNote: addNoteTxt.text,
        date: datePicked.value,
        time: timePicked.value,
        amount: addAmountTxt.text,
        currency: '₹');
    print("Time: ${timePicked.value}");
    await DatabaseRepository.instance.insert(expenseDbModel: expenseDbModel);
  }

  void getExpanse() async {
    await DatabaseRepository.instance.getAllExpense().then((value) {
      int i = 0;
      while (i < value.length) {
        var expanse = value[i];
        print(
            "Expanse List: id:${expanse.id}, acc:${expanse.account}, cat:${expanse.category}, note:${expanse.expenseNote}, date:${expanse.date}, time:${expanse.time}, amt:${expanse.amount}, curr:${expanse.currency}");
        i++;
      }
    }).catchError((e) => debugPrint(e.toString()));
  }
}
