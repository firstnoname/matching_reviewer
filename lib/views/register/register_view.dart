import 'package:flutter/material.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:matching_reviewer/views/register/general_info_view.dart';
import 'package:matching_reviewer/views/register/product_expertise_view.dart';

import '../../utilities/utilities.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              const CircleAvatar(),
              TextButton(
                child: const Text('Edit Photo'),
                onPressed: () {},
              ),
              Row(
                children: const [
                  GeneralInfoView(),
                  ProductExpertiseView(),
                ],
              ),
              ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    QuestionnaireAPI().testAddData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
