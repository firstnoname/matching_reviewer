import 'package:firebase_auth/firebase_auth.dart';

import '../../blocs/blocs.dart';
import '../models/user.dart' as AppModel;
import 'services.dart';

class Authentication {
  final AppManagerBloc _AppManagerBloc;
  static Authentication? _cache;
  final FirebaseAuth _firebaseAuth;

  User? get firebaseCurrentUser => _firebaseAuth.currentUser;

  factory Authentication(AppManagerBloc AppManagerBloc) {
    _cache ??= Authentication._(AppManagerBloc);
    return _cache!;
  }

  Authentication._(this._AppManagerBloc)
      : _firebaseAuth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    int? resendToken,
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      forceResendingToken: resendToken,
    );
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOut() => _firebaseAuth
      .signOut()
      .then((_) => print('Log out succeeded'))
      .catchError((e) => print('Error occurred: ${e.toString()}'));

  Future<void> signInWithPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await signInWithCredential(phoneAuthCredential);
  }

  Future<void> signInWithCredential(AuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
    await checkCurrentUserProfile();
  }

  checkCurrentUserProfile() async {
    UserAPI().getUser(_firebaseAuth.currentUser!.uid).then((user) async {
      // if (user == null) {
      //   _AppManagerBloc.updateCurrentUserProfile(
      //       AppModel.User.fromFirebaseUser(_firebaseAuth.currentUser!));
      //   _AppManagerBloc.add(ICharmManagerEventShowUserPolicy());
      // } else {
      //   _AppManagerBloc.updateCurrentUserProfile(user);
      //   _AppManagerBloc.add(ICharmManagerEventLoginSuccess());
      // }
    });
  }
}
