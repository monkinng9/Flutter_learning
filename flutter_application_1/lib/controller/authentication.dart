import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets.dart';

enum ApplicationLoginState {
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
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
    required this.startLoginFlow,
    required this.loginState,
  });

  // Class attribute -- Email&Password
  final String? email;

  /// verify Email Abstract
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;

  /// Sign in verify Abstract
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;

  // Cancle Registation Abstract method
  final void Function() cancelRegistration;

  // Registation Abstract method
  /// require
  /// - email, displayName, password
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  // Start Login Abstract method
  final void Function() startLoginFlow;

  // Signout Abstract method
  final void Function() signOut;

  // Login State attribute
  /// final - <enum> - <Enum's attribute>
  final ApplicationLoginState loginState;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      // Not Signed in
      case ApplicationLoginState.loggedOut:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              // Button attribute with style
              /// StyledButton import from widgets.dart
              child: StyledButton(
                onPressed: () {
                  startLoginFlow();
                },
                child: const Text('RSVP'),
              ),
            ),
          ],
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm(
            // If email not valid show Dialog box
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));

      case ApplicationLoginState.register:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              // Button attribute with style
              /// StyledButton import from widgets.dart
              child: StyledButton(
                onPressed: () {
                  startLoginFlow();
                },
                child: const Text('RSVP'),
              ),
            ),
          ],
        );
      case ApplicationLoginState.password:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              // Button attribute with style
              /// StyledButton import from widgets.dart
              child: StyledButton(
                onPressed: () {
                  startLoginFlow();
                },
                child: const Text('RSVP'),
              ),
            ),
          ],
        );
      case ApplicationLoginState.loggedIn:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              // Button attribute with style
              /// StyledButton import from widgets.dart
              child: StyledButton(
                onPressed: () {
                  startLoginFlow();
                },
                child: const Text('RSVP'),
              ),
            ),
          ],
        );
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            StyledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}

class EmailForm extends StatefulWidget {
  // ทำไมต้อง Callback?
  /// => เพื่อเรียกใช้งาน email ก่อนแล้วจึงเริ่มทำงานบน class
  const EmailForm({required this.callback});
  final void Function(String email) callback;

  @override
  // State<EmailForm> createState() => _EmailFormState();
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  // GlobalKeys เป็นอีกหนึ่ง Key ที่ค่อนข้างพิเศษ เพราะ Key ตัวนี้จะทำให้ State
  //    นั้นผูกกับ Widget ของเรา ไม่ว่าเราจะย้าย Widget นั้นไปอยู่ตรงไหนในแอป!
  //    ซึ่งเราอาจนำมาประยุกต์ใช้ในกรณีที่เราต้องการ Global variable ได้เช่นกัน
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header import from widgets.dart
        const Header('Sign in with email'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 30),
                      child: StyledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text);
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
