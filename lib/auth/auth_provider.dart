import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin FirebaseAuthCallback {
  onSuccessLogin(UserCredential credential) {
    // optional
  }

  onFailedLogin() {
    // optional
  }

  onSuccessLogout() {
    // optional
  }

  onFailedLogout() {
    // optional
  }
}

abstract class FirebaseAuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseAuthCallback? callback;

  FirebaseAuthProvider(this.callback);

  Future<UserCredential?> login();

  Future<void> logout() => _auth.signOut();
}

class GoogleAuth extends FirebaseAuthProvider {
  GoogleAuth({FirebaseAuthCallback? callback}) : super(callback);

  @override
  Future<UserCredential?> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential result = await _auth.signInWithCredential(credential);
    callback?.onSuccessLogin(result);
    return result;
  }
}

class AppleAuth extends FirebaseAuthProvider {
  AppleAuth({FirebaseAuthCallback? callback}) : super(callback);

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<UserCredential?> login() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return await _auth.signInWithCredential(oauthCredential);
  }
}
