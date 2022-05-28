import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';
import 'package:matching_reviewer/views/views.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User _userInfo = context.read<AppManagerBloc>().member;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MatchingView(),
                    )),
                child: const Text('Matching')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<AppManagerBloc>(context).appAuth.signOut(),
                child: const Text('Profile')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<AppManagerBloc>(context).appAuth.signOut(),
                child: const Text('Logout')),
          ),
        ],
      ),
      body: _userInfo.userRole == 'reviewer'
          ? const ReviewerView()
          : const SMEView(),
    );
  }
}
