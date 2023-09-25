import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sqlitemanager.dart';
import 'header.dart' as hd;

class Writer extends StatefulWidget {
  String? title;
  Writer({Key? key, this.title}) : super(key: key);

  @override
  State<Writer> createState() => _WriterState();
}

class _WriterState extends State<Writer> {
  late final height = MediaQuery.of(context).size.height;
  late final width = MediaQuery.of(context).size.width;
  late final TextEditingController title = TextEditingController();
  late final TextEditingController notes = TextEditingController();

  Future<void> New() async {
    await SQLHelper.createItem(title.text, notes.text);
    setState(() {
      showAboutDialog(context: context, children: [Text('Saved')]);
    });
    print('suksess sih');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: hd.header('Notsy'),
        body: SingleChildScrollView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          child: Column(
            children: [
              Container(
                width: width / 1.1,
                child: TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: 'Title here...',
                    hintStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: height,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(20)),
                width: width,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: notes,
                  decoration: InputDecoration(hintText: 'Text here'),
                  keyboardType: TextInputType.multiline,
                  // expands: true,
                  maxLines: 25,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: DraggableFab(
          // initPosition: const Offset(0.5, 0.5),
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            label: const Text(
              'Save',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            onPressed: () {},
          ),
        ),
      );
}
