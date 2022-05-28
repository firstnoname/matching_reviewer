import 'package:flutter/material.dart';

class SMEView extends StatelessWidget {
  const SMEView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('เพิ่มข้อมูลสินค้า'))
        ],
      ),
    );
  }
}
