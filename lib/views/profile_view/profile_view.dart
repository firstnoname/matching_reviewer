import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matching_reviewer/blocs/blocs.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/views/profile_view/bloc/profile_bloc.dart';
import 'package:matching_reviewer/views/register/product_expertise_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User _userInfo = context.read<AppManagerBloc>().member!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileUpdateSuccess) {
              Future.microtask(() => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/success.svg'),
                                      const Text('แก้ไขข้อมูลสำเร็จ'),
                                    ],
                                  ),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close')),
                              )
                            ],
                          ),
                        ),
                      )));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        Center(
                          child: _userInfo.imageProfilePath != null
                              ? CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.06,
                                  backgroundImage:
                                      NetworkImage(_userInfo.imageProfilePath!),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blueGrey[200],
                                  radius:
                                      MediaQuery.of(context).size.width * 0.06,
                                  child: SvgPicture.asset(
                                      'assets/images/no_image_avatar.svg'),
                                ),
                        ),
                        TextFormField(
                          initialValue: _userInfo.firstName,
                          onChanged: (value) {
                            _userInfo.firstName = value;
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        TextFormField(
                          initialValue: _userInfo.lastName,
                          onChanged: (value) {
                            _userInfo.lastName = value;
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            const Icon(Icons.call, color: Colors.blue),
                            Text(_userInfo.phoneNumber.toString())
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ProductExpertiseView(
                            productExpertise: _userInfo.productExpertise!,
                            onUpdateValue: (prod) {
                              _userInfo.productExpertise = prod;
                            }),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Center(
                            child: ElevatedButton(
                          child: const Text('แก้ไข'),
                          onPressed: () => context
                              .read<ProfileBloc>()
                              .add(ProfileSubmitted(userInfo: _userInfo)),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
