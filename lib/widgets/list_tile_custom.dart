import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final Color color;
  const ListTileCustom({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(title),
    );
  }
}
