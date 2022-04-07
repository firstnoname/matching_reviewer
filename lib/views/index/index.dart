import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';
import 'package:matching_reviewer/views/views.dart';

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

    callAPI();

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
                    child: Card(
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              radius: 50,
                              child: Icon(Icons.people),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chatnattaphon Ratnaratorn',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: const [
                                  ChipGenerator(
                                      label: 'Food', color: Color(0xFFff6666)),
                                  ChipGenerator(
                                      label: 'Cosmetics',
                                      color: Color(0xFF007f5c)),
                                  ChipGenerator(
                                      label: 'Cloths',
                                      color: Color(0xFF5f65d3)),
                                  ChipGenerator(
                                      label: 'Services',
                                      color: Color(0xFF19ca21)),
                                ],
                              ),
                            ],
                          )
                        ],
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
