import 'package:flutter/material.dart';
import 'package:matching_reviewer/views/views.dart';

class SMEView extends StatelessWidget {
  const SMEView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => const AddProductDetail()),
              child: Row(
                children: const [Icon(Icons.add), Text('เพิ่มข้อมูลสินค้า')],
              ))
        ],
      ),
    );
  }
}
