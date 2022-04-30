import 'package:flutter/material.dart';

enum ApplicationLoginState { 
  
}

class Authentication extends ChangeNotifier {
  Authentication({
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.cancelRegistration,
    required this.signInWithEmailAndPassword,
    required this.registerAccount,
    required this.signOut,
    required this.verifyEmail,
  });
  
  final ApplicationLoginState loginState;
  final String? email;

  final void Function() startLoginFlow;
  
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;

  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;

  final void Function() cancelRegistration;

  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  final void Function() signOut;

}