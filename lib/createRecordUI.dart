import 'package:budget_track/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget accountCategory() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      accountCategoryUI("account", "Online Food".toUpperCase()),
      accountCategoryUI("category", "Food & Drink".toUpperCase())
    ],
  );
}

Widget addNote(TextEditingController addNoteTxt) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      maxLines: 1,
      textCapitalization: TextCapitalization.sentences,
      controller: addNoteTxt,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: "Add Note ...",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.brown, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.brown, width: 1),
        ),
        //
      ),
    ),
  );
}

Widget dateTime(BuildContext context, RxString stDate, RxString stTime) {
  stTime = TimeOfDay.now().format(context).obs;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {
          Utils.datePicker(context).then((value) {
            stDate.value = value;
          });
        },
        child: Obx(() => Text(stDate.value)),
      ),
      GestureDetector(
        onTap: () {
          Utils.timePicker(context).then((value) {
            stTime.value = value;
          });
        },
        child: Obx(() => Text(stTime.value)),
      ),
    ],
  );
}

Widget amountUI(TextEditingController addAmountTxt) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.brown, width: 1),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("-"),
        const Text("₹"),
        SizedBox(
          width: 100,
          child: TextField(
            textAlign: TextAlign.center,
            autocorrect: false,
            maxLines: 1,
            controller: addAmountTxt,
            decoration: InputDecoration.collapsed(
              hintText: "0",
            ),
          ),
        ),
        Image.asset(
          "assets/images/delete.png",
          width: 28,
        )
      ],
    ),
  );
}

Widget numberCalculation(){
  return Column(
      children: [
        numberCalculationUI("7", "8", "9", "/"),
        numberCalculationUI("4", "5", "6", "X"),
        numberCalculationUI("1", "2", "3", "-"),
        numberCalculationUI(".", "0", "=", "+"),
      ],
  );
}

Widget accountCategoryUI(String topText, String bottomText) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(topText), Text(bottomText)],
    ),
  );
}

Widget numberCalculationUI(String text1, String text2, String text3, String text4){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(text1),
      Text(text2),
      Text(text3),
      Text(text4),
    ],
  );
}
