import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/widgets/user_card_widget.dart';

class MatchingDetail extends StatelessWidget {
  final Matching matchingInfo;

  const MatchingDetail({Key? key, required this.matchingInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          UserCardWidget(userInfo: matchingInfo.reviewer),
          Row(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'เงื่อนไขการว่าจ้าง'),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
