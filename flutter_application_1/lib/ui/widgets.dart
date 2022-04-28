import 'package:flutter/material.dart';

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  Widget build(BuildContext build) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(detail, style: const TextStyle(fontSize: 16)),
          ],
        ),
      );
}
