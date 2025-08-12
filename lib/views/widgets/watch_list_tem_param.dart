import 'package:flutter/material.dart';

class WatchListItemParam extends StatelessWidget {
  final Icon paramIcon;
  final String paramText;
  const WatchListItemParam({
    super.key,
    required this.paramIcon,
    required this.paramText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        paramIcon,
        Text(
          paramText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
