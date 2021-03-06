import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/models/product_expertise/product_expertise.dart';
import 'package:matching_reviewer/views/register/bloc/register_bloc.dart';
import 'package:matching_reviewer/views/register/general_info_view.dart';
import 'package:matching_reviewer/views/register/product_expertise_view.dart';

import '../../blocs/blocs.dart';
import 'entrepreneur_view.dart';

class RegisterView extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final bool isReviewer;
  User _userInfo = User();

  ProductExpertise _productExpertise = ProductExpertise(
      food: Food(), cosmetic: Cosmetic(), cloth: Cloth(), service: Service());



  RegisterView({Key? key, this.isReviewer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List? _profileImage;

    onUpdateExpertise(ProductExpertise productExpertise) {
      _productExpertise = productExpertise;
    }

    onUpdateUserInfo(User userInfo) {
      _userInfo = userInfo;
    }

    return BlocBuilder<AppManagerBloc, AppManagerState>(
      builder: (context, state) {
        if (state is AppManagerStateLoginSuccess) {
          Future.delayed(Duration.zero, () {
            Navigator.pop(context);
          });
        }
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Form(
                key: _key,
                child: BlocProvider<RegisterBloc>(
                  create: (context) => RegisterBloc(
                      appManagerBloc: context.read<AppManagerBloc>(),
                      isReviewer: isReviewer),
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterStateSelectImageSuccess) {
                        _profileImage = state.imageBytes;
                      }
                      return isReviewer == true
                          ? _buildReviewerForm(
                              _userInfo,
                              _profileImage,
                              context,
                              _productExpertise,
                              onUpdateExpertise,
                              onUpdateUserInfo)
                          : _buildEntrepreneurForm(
                              _userInfo,
                              _profileImage,
                              context,
                              _productExpertise,
                              onUpdateExpertise,
                              onUpdateUserInfo);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildEntrepreneurForm(
      User userInfo,
      Uint8List? _profileImage,
      BuildContext context,
      ProductExpertise productExpertise,
      dynamic onUpdateProductExpertise,
      dynamic onUpdateUserInfo) {
    return Column(
      children: [
        _profileImage == null
            ? const CircleAvatar(
                radius: 70,
              )
            : CircleAvatar(
                backgroundImage: MemoryImage(_profileImage),
                radius: 70,
              ),
        TextButton(
          child: const Text('Edit Photo'),
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterEventSelectImage()),
        ),
        Row(
          children: [
            Column(
              children: [
                GeneralInfoView(
                  userInfo: userInfo,
                  onUpdateUserInfo: onUpdateUserInfo,
                  isReviewer: false,
                ),
                EntrepreneurView(
                    userInfo: _userInfo, onUpdateUserInfo: onUpdateUserInfo),
              ],
            ),
            ProductExpertiseView(
                productExpertise: productExpertise,
                onUpdateValue: onUpdateProductExpertise),
          ],
        ),
        ElevatedButton(
          child: const Text('Register'),
          onPressed: () {
            if (_key.currentState!.validate()) {
              _userInfo.id = context
                  .read<AppManagerBloc>()
                  .appAuth
                  .firebaseCurrentUser!
                  .uid;
              _userInfo.phoneNumber = context
                  .read<AppManagerBloc>()
                  .appAuth
                  .firebaseCurrentUser!
                  .phoneNumber;
              _userInfo.productExpertise = _productExpertise;

              context
                  .read<RegisterBloc>()
                  .add(RegisterEventSubmittedForm(userInfo: _userInfo));
              // QuestionnaireAPI().testAddData();
            }
          },
        ),
      ],
    );
  }

  Column _buildReviewerForm(
      User userInfo,
      Uint8List? _profileImage,
      BuildContext context,
      ProductExpertise productExpertise,
      dynamic onUpdateProductExpertise,
      dynamic onUpdateUserInfo) {
    return Column(
      children: [
        _profileImage == null
            ? const CircleAvatar(
                radius: 70,
              )
            : CircleAvatar(
                backgroundImage: MemoryImage(_profileImage),
                radius: 70,
              ),
        TextButton(
          child: const Text('Edit Photo'),
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterEventSelectImage()),
        ),
        Row(
          children: [
            GeneralInfoView(
                userInfo: userInfo,
                onUpdateUserInfo: onUpdateUserInfo,
                isReviewer: true),
            ProductExpertiseView(
                productExpertise: productExpertise,
                onUpdateValue: onUpdateProductExpertise),
          ],
        ),
        ElevatedButton(
          child: const Text('Register'),
          onPressed: () {
            if (_key.currentState!.validate()) {
              _userInfo.id = context
                  .read<AppManagerBloc>()
                  .appAuth
                  .firebaseCurrentUser!
                  .uid;
              _userInfo.phoneNumber = context
                  .read<AppManagerBloc>()
                  .appAuth
                  .firebaseCurrentUser!
                  .phoneNumber;
              _userInfo.productExpertise = _productExpertise;

              context
                  .read<RegisterBloc>()
                  .add(RegisterEventSubmittedForm(userInfo: _userInfo));
            }
          },
        ),
      ],
    );
  }
}
