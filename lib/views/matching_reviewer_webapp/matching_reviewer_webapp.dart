import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:matching_reviewer/blocs/blocs.dart';
import 'package:matching_reviewer/utilities/utilities.dart';
import 'package:matching_reviewer/views/register/select_role.dart';

import '../views.dart';

class MatchingReviewerWebApp extends StatelessWidget {
  const MatchingReviewerWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppManagerBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemes(context),
        builder: UIFeedback.init(),
        home: Builder(builder: (context) {
          return StreamBuilder<User?>(
            // stream: FirebaseAuth.instance.authStateChanges(),
            stream: context
                .read<AppManagerBloc>()
                .appAuth
                .firebaseAuth
                .authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                context
                    .read<AppManagerBloc>()
                    .add(AppManagerEventFirebaseAuthenticated());
              } else {
                context.read<AppManagerBloc>().add(AppManagerEventLoginFailure(
                    message: '${snapshot.connectionState}'));
              }
              // return _buildHome(_isLoggedIn);
              return _buildLayout();
            },
          );
        }),
      ),
    );
  }

  Widget _buildLayout() {
    return BlocBuilder<AppManagerBloc, AppManagerState>(
      builder: ((context, state) {
        Widget layout;
        if (state is AppManagerStateRegisterStart) {
          layout = const SelectRole();
        } else if (state is AppManagerStateLoginSuccess) {
          layout = const Index();
        } else {
          // layout = PhoneInputScreen(
          //   auth: context.read<AppManagerBloc>().appAuth.firebaseAuth,
          //   sideBuilder: (context, constraints) {
          //     return Padding(
          //       padding: const EdgeInsets.all(20),
          //       child: AspectRatio(
          //         aspectRatio: 1,
          //         child: Image.asset(
          //             'assets/images/login_view/login_side_icon.png'),
          //       ),
          //     );
          //   },
          // );
          layout = SignInScreen(
            sideBuilder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                      'assets/images/login_view/login_side_icon.png'),
                ),
              );
            },
            providerConfigs: const [
              PhoneProviderConfiguration(),
            ],
          );
        }
        return layout;
      }),
    );
  }
}
