import 'package:flutter/material.dart';
import 'package:matching_reviewer/views/register/general_info_view.dart';
import 'package:matching_reviewer/views/register/product_expertise_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(),
            TextButton(
              child: Text('Edit Photo'),
              onPressed: () {},
            ),
            Row(
              children: const [
                GeneralInfoView(),
                ProductExpertiseView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
