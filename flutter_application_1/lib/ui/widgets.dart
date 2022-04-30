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

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
      );
}

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;
  // @override
  // Widget build(BuildContext context) don't use
  // Use expression when it's component
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}
