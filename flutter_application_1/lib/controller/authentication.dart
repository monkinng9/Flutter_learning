import 'package:flutter/material.dart';

enum ApplicationLoginstate {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn
}

class Authentication extends StatelessWidget {
  // Required Attribute
  const Authentication({
    required this.email,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
  });

  // Class attribute -- Email&Password
  final String? email;

  /// verify Email Abstract
  final void Function(
    String? email,
    void Function(Exception e) error,
  ) verifyEmail;

  /// Sign in verify Abstract
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
