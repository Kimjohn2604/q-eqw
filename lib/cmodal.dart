import 'package:flutter/material.dart';

class CMODAL extends StatelessWidget {
  CMODAL({super.key, required this.add});
  final Function add;
  String textvalue = '';
  void handleAdd(BuildContext context) {
    if (textvalue.length == 0) return;
    add(textvalue);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextField(
                    onChanged: (text) => {textvalue = text},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Your task'),
                    )),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {handleAdd(context)},
                        child: Text('Add')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
