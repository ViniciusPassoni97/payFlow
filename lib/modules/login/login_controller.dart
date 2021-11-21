import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playflow/shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final user = await _googleSignIn.signIn();

      authController.setUser(context, user);
      print(user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
