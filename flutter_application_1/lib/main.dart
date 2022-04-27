import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Meetup',
      // Theme app setup but show in Homepage class
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Import HomePage class
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show Application Bar
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          // Import Image
          Image.asset('assets/codelab.png'),
          const SizedBox(height: 8),
          // Import specific Widget
          const IconAndDetail(Icons.calendar_today, 'October 30'),
        ],
      ),
    );
  }
}

class IconAndDetail extends StatelessWidget {
  // We don't use key for class that not dependent
  //    mean export to HomePage class
  // const IconAndDetail({Key? key}) : super(key: key);

  // Class Attribute
  final IconData icon;
  final String detail;
  const IconAndDetail(this.icon, this.detail);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // children is subset of child
          children: [
            // Add Icon component
            Icon(icon),
            const SizedBox(width: 8),
            // Add text component
            Text(
              detail,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  // Initialize Firebase with setting in Firebaseoption
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
