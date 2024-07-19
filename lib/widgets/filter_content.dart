import 'package:flutter/material.dart';

class FilterContent extends StatelessWidget {
  final IconData? icon;
  final String? title;
  const FilterContent({
    super.key,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black54,
        ),
        Text(
          '$title',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
