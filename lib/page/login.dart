import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostark_pattern/auth/auth_provider.dart';
import 'package:lostark_pattern/page/base.dart';
import 'package:lostark_pattern/widget/login_button.dart';

class LoginPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> with FirebaseAuthCallback {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LoginButton(
            provider: GoogleAuth(callback: this),
            child: Text("구글 아이디로 로그인"),
          ),
          LoginButton(
            provider: AppleAuth(callback: this),
            child: Text("애플 아이디로 로그인"),
          ),
        ],
      ),
    );
  }

  @override
  onSuccessLogin(UserCredential credential) {
    close(context);
  }

  @override
  onFailedLogin() {
    // TODO: implement onFailedLogin
  }
}
