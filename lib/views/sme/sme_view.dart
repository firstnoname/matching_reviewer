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
              )),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle:
                        Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('LISTEN'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
