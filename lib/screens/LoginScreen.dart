import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String uid;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
      _handleSignIn();
    });

    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signInSilently();

      final auth = await _currentUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      final firebaseUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      uid = firebaseUser.user.uid;
      Navigator.of(context).pushNamed('/home');
    } catch (error) {
      print('ERRR IN SIGN IN');
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login by pressing the button below.'),
              SignInButton(
                Buttons.Google,
                onPressed: () => _handleSignIn(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
