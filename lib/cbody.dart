import 'package:flutter/material.dart';

class CBODY extends StatelessWidget {
  CBODY(
      {super.key,
      required this.item,
      required this.delete,
      required this.index});
  var item;
  var index;
  final Function delete;

  void handleDelete(id) {
    delete(id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: ((index + 1) % 2 == 0
                ? Color.fromARGB(255, 11, 197, 197)
                : Color.fromARGB(255, 76, 182, 214)),
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () => {handleDelete(item.id)},
                child: const Icon(
                  Icons.delete_outline_outlined,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
