import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<AppManagerBloc>(context).appAuth.signOut(),
              child: const Text('Logout')),
        ],
      ),
      body: const Center(
        child: Text('Index'),
      ),
    );
  }
}
