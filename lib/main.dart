import 'package:flutter/material.dart';

import 'cbody.dart';
import 'cmodal.dart';

void main() {
  runApp(const MaterialApp(
    home: ListData(),
    debugShowCheckedModeBanner: false,
  ));
}

class ID {
  String id;
  String value;
  ID({required this.id, required this.value});
}

final List<ID> items = [];

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  void handleDplay(String name) {
    final newItem = ID(id: DateTime.now().toString(), value: name);
    setState(() {
      items.add(newItem);
    });
  }

  void handleRemove(String id) {
    setState(() {
      items.removeWhere((x) => x.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: items
                .map(
                  (item) => CBODY(
                      item: item,
                      delete: handleRemove,
                      index: items.indexOf(item)),
                )
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              context: context,
              builder: (BuildContext content) {
                return CMODAL(add: handleDplay);
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
