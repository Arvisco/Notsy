import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sqlitemanager.dart';
import 'header.dart' as head;

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Map<String, dynamic>> notes = [];
  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void refresh() async {
    final data = await SQLHelper.getItems();
    setState(() {
      notes = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: head.header('Notsy'),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/details');
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                       notes[index][],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30),
                      ),
                    ));
              }),
        ),
        floatingActionButton: DraggableFab(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/writer');
            },
            child: const Icon(
              CupertinoIcons.pencil,
              size: 30,
            ),
          ),
        ),
      );
}
