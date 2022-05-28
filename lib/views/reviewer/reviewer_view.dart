import 'package:flutter/material.dart';

class ReviewerView extends StatelessWidget {
  const ReviewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              // child: buildList(),
              child: const Text('Reviewer'),
            ),
          ),
        ),
      ],
    );
  }
}
