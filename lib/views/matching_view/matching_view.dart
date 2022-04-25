import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/views/matching_view/bloc/matching_bloc.dart';

import '../../widgets/widgets.dart';

class MatchingView extends StatelessWidget {
  const MatchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matching'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => MatchingBloc(),
          child: BlocBuilder<MatchingBloc, MatchingState>(
            builder: (context, state) {
              if (state is MatchingInitial) {
                return _selectRole(context);
              } else if (state is MatchingStateGetUsersSuccess) {
                return _listBuilder(users: state.users);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _selectRole(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Entrepreneur'),
              onPressed: () => context
                  .read<MatchingBloc>()
                  .add(MatchingEventSelectRole(isReviewer: false)),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              child: const Text('Reviewer'),
              onPressed: () => context
                  .read<MatchingBloc>()
                  .add(MatchingEventSelectRole(isReviewer: true)),
            )
          ],
        ),
      ),
    );
  }

  Widget _listBuilder({required List<User> users}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _showMyDialog(context),
        child: UserCardWidget(userInfo: users[index]),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('Confirm paring between reviewer and entrepreneur?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    UserCardWidget(
                        userInfo: User(
                            firstName: 'Chatnattaphon',
                            lastName: 'Ratnaratorn',
                            userRole: 'reviewer')),
                    UserCardWidget(
                        userInfo: User(
                            firstName: 'Some company',
                            lastName: '',
                            userRole: 'entrepreneur')),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              style: TextButton.styleFrom(primary: Colors.lightGreen),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              style: TextButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
