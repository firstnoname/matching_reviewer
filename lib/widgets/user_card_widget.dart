import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';

import 'widgets.dart';

class UserCardWidget extends StatelessWidget {
  final User userInfo;

  const UserCardWidget({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: userInfo.userRole == 'reviewer'
          ? Colors.blueAccent[100]
          : Colors.redAccent[100],
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50,
              child: Icon(Icons.people),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${userInfo.firstName} ${userInfo.lastName}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: const [
                  ChipGenerator(label: 'Food', color: Color(0xFFff6666)),
                  ChipGenerator(label: 'Cosmetics', color: Color(0xFF007f5c)),
                  ChipGenerator(label: 'Cloths', color: Color(0xFF5f65d3)),
                  ChipGenerator(label: 'Services', color: Color(0xFF19ca21)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
