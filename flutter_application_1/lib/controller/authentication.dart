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
    required this.cancleRegistration,
    required this.registerAccount,
    required this.signOut,
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

  // Cancle Registation Abstract method
  final void Function() cancleRegistration;

  // Registation Abstract method
  /// require
  /// - email, displayName, password
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  // Signout Abstract method
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
