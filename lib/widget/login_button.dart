import 'package:flutter/material.dart';
import 'package:lostark_pattern/auth/auth_provider.dart';

class LoginButton extends TextButton {
  final FirebaseAuthProvider provider;

  LoginButton({
    required this.provider,
    required Widget child,
  }) : super(child: child, onPressed: () => provider.login());
}