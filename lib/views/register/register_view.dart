import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';
import 'package:matching_reviewer/services/services.dart';
import 'package:matching_reviewer/views/register/bloc/register_bloc.dart';
import 'package:matching_reviewer/views/register/general_info_view.dart';
import 'package:matching_reviewer/views/register/product_expertise_view.dart';
import 'package:matching_reviewer/views/views.dart';

import '../../models/models.dart';

class RegisterView extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final isReviewer;

  RegisterView({Key? key, this.isReviewer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List? _profileImage;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterStateSelectImageSuccess) {
                  _profileImage = state.imageBytes;
                }
                return isReviewer == true
                    ? _buildReviewerForm(_profileImage, context)
                    : _buildEntrepreneurForm(_profileImage, context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _buildEntrepreneurForm(
      Uint8List? _profileImage, BuildContext context) {
    return Column(
      children: [
        _profileImage == null
            ? const CircleAvatar(
                radius: 70,
              )
            : CircleAvatar(
                backgroundImage: MemoryImage(_profileImage!),
                radius: 70,
              ),
        TextButton(
          child: const Text('Edit Photo'),
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterEventSelectImage()),
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
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Index();
              },
            ));
            // if (_key.currentState!.validate()) {
            //   User _userInfo = User();
            //   _userInfo.id = context
            //       .read<AppManagerBloc>()
            //       .appAuth
            //       .firebaseCurrentUser!
            //       .uid;
            //   context.read<RegisterBloc>().add(
            //       RegisterEventSubmittedForm(userInfo: _userInfo));
            //   // QuestionnaireAPI().testAddData();
            // }
          },
        ),
      ],
    );
  }

  Column _buildReviewerForm(Uint8List? _profileImage, BuildContext context) {
    return Column(
      children: [
        _profileImage == null
            ? const CircleAvatar(
                radius: 70,
              )
            : CircleAvatar(
                backgroundImage: MemoryImage(_profileImage!),
                radius: 70,
              ),
        TextButton(
          child: const Text('Edit Photo'),
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterEventSelectImage()),
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
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Index();
              },
            ));
            // if (_key.currentState!.validate()) {
            //   User _userInfo = User();
            //   _userInfo.id = context
            //       .read<AppManagerBloc>()
            //       .appAuth
            //       .firebaseCurrentUser!
            //       .uid;
            //   context.read<RegisterBloc>().add(
            //       RegisterEventSubmittedForm(userInfo: _userInfo));
            //   // QuestionnaireAPI().testAddData();
            // }
          },
        ),
      ],
    );
  }
}
