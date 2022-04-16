import 'package:cloud_firestore/cloud_firestore.dart';
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
    void callAPI() async {
      var result = await FirebaseFirestore.instance.collection('users').where(
          'product_expertise.food',
          arrayContainsAny: ['Fresh food', 'Processed food']).get();
      print(result.docs[0].data());
    }

    // callAPI();

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<AppManagerBloc>(context).appAuth.signOut(),
              child: const Text('Logout')),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MatchingView(),
                        )),
                    child: UserCardWidget(
                      userInfo: User(
                        firstName: 'Chatnattaphon',
                        lastName: 'Ratnaratorn',
                        userRole: 'reviewer',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
