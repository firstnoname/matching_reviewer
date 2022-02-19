import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/views/matching_reviewer_webapp/matching_reviewer_webapp.dart';

import '../blocs/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDrTEp2f2cHD-XgNd9SBcfr7LbyEMkM6fk",
      appId: "1:806495140174:web:ff316bedf2bd13b9ac461f",
      messagingSenderId: "806495140174",
      projectId: "matching-reviewer",
    ),
  );

  BlocOverrides.runZoned(() => null, blocObserver: ABlocObserver());
  runApp(const MatchingReviewerWebApp());
}
