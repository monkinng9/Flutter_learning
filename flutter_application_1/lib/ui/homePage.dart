import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/authentication.dart';
import 'package:flutter_application_1/ui/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/codelab.png'),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(),
          const Divider(
            thickness: 1,
            height: 8,
            color: Colors.grey,
          ),
          const Header("What we'll be doing"),
          const Paragraph(
              "Join Us for a day full of Firebase Workshops and Pizza"),
        ],
      ),
    );
  }
}
