import 'package:flutter/material.dart';

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