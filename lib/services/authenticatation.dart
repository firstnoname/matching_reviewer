import 'package:firebase_auth/firebase_auth.dart';

import '../../blocs/blocs.dart';
import 'services.dart';

class Authentication {
  final AppManagerBloc _appManagerBloc;
  static Authentication? _cache;
  final FirebaseAuth _firebaseAuth;

  FirebaseAuth get firebaseAuth => _firebaseAuth;
  User? get firebaseCurrentUser => _firebaseAuth.currentUser;

  factory Authentication(AppManagerBloc appManagerBloc) {
    _cache ??= Authentication._(appManagerBloc);
    return _cache!;
  }

  Authentication._(this._appManagerBloc)
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
    var user = await UserAPI().getUser(_firebaseAuth.currentUser!.uid);
    if (user != null) {
      // update user info in app.
      _appManagerBloc.updateCurrentUserProfile(_firebaseAuth.currentUser, user);
      _appManagerBloc.add(AppManagerEventLoginSucceed());
      // _appManagerBloc.add(ICharmManagerEventShowUserPolicy());
    } else {
      // user register flow.
      _firebaseAuth.currentUser!.uid;
      _appManagerBloc.add(AppManagerEventUserRegisterStart());
    }
  }
}
