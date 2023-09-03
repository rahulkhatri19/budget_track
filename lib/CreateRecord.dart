import 'package:flutter/material.dart';

class CreateRecord extends StatelessWidget{
  const CreateRecord({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
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
            Icon(Icons.close),
            Icon(Icons.check),
            Icon(Icons.check_box),
          ],
        ),
      ),
    );
  }
}