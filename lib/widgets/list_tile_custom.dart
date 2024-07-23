import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const ListTileCustom({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.green,
      ),
      title: Text(title),
    );
  }
}
