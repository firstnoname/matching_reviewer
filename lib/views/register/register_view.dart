import 'package:flutter/material.dart';
import 'package:matching_reviewer/services/services.dart';
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
            const CircleAvatar(),
            TextButton(
              child: const Text('Edit Photo'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('test add data'),
              onPressed: () => QuestionnaireAPI().testAddData(),
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
