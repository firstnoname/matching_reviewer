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
    User _userInfo = User(firstName: 'Chatnattpahon', lastName: 'Ratnaratorn');
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                // child: buildList(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
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
                                    '${_userInfo.firstName} ${_userInfo.lastName}',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: const [
                                      ChipGenerator(
                                          label: 'Food',
                                          color: Color(0xFFff6666)),
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildList() {
    return ListView.builder(
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
    );
  }
}
