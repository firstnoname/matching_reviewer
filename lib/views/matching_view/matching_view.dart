import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/widgets/chip_generator.dart';

import '../../widgets/widgets.dart';

class MatchingView extends StatelessWidget {
  const MatchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrepreneur, SME'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _showMyDialog(context),
                    child: Card(
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
                                'Some company name',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: const [
                                  ChipGenerator(
                                      label: 'Food', color: Color(0xFFff6666)),
                                  ChipGenerator(
                                      label: 'Cosmetics',
                                      color: Color(0xFF007f5c)),
                                  ChipGenerator(
                                      label: 'Cloths',
                                      color: Color(0xFF5f65d3)),
                                  ChipGenerator(
                                      label: 'Services',
                                      color: Color(0xFF19ca21)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('Confirm paring between reviewer and entrepreneur?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    UserCardWidget(
                        userInfo: User(
                            firstName: 'Chatnattaphon',
                            lastName: 'Ratnaratorn',
                            userRole: 'reviewer')),
                    UserCardWidget(
                        userInfo: User(
                            firstName: 'Some company',
                            lastName: '',
                            userRole: 'entrepreneur')),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              style: TextButton.styleFrom(primary: Colors.lightGreen),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              style: TextButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
