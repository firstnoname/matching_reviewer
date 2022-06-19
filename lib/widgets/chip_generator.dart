import 'package:flutter/material.dart';

class ChipGenerator extends StatelessWidget {
  final String label;
  final Color color;
  final bool isSelected;

  const ChipGenerator(
      {Key? key,
      required this.label,
      required this.color,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        labelPadding: const EdgeInsets.all(2.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.white70,
          child: Text(label[0].toUpperCase()),
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: isSelected == true ? 36 : 14 ,
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
