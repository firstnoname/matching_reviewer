import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:matching_reviewer/blocs/blocs.dart';
import 'package:matching_reviewer/utilities/utilities.dart';

import '../views.dart';

class MatchingReviewerWebApp extends StatelessWidget {
  const MatchingReviewerWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppManagerBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemes(context),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              _isLoggedIn = false;
            } else {
              _isLoggedIn = true;
            }
            return _buildHome(_isLoggedIn);
          },
        ),
      ),
    );
  }

  Widget _buildHome(bool isLoggedIn) {
    Widget buildScreen;
    switch (isLoggedIn) {
      case true:
        // buildScreen = const Index();
        buildScreen = const RegisterView();
        break;
      default:
        buildScreen = SignInScreen(
          sideBuilder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1,
                child:
                    Image.asset('assets/images/login_view/login_side_icon.png'),
              ),
            );
          },
          providerConfigs: const [
            PhoneProviderConfiguration(),
          ],
        );
    }
    return buildScreen;
  }
}
