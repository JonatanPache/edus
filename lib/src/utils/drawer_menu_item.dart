import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  const DrawerMenuItem(
      {super.key, required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
