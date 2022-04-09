import 'package:flutter/material.dart';
import 'package:matching_reviewer/views/register/register_view.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('Reviewer'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterView(isReviewer: true),
                    ))),
            const SizedBox(width: 36),
            ElevatedButton(
                child: const Text('Entrepreneur/SMEs'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterView(),
                    ))),
          ],
        ),
      ),
    );
  }
}
