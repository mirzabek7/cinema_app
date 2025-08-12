import 'package:flutter/material.dart';
import '../../utils/custom_colors.dart';

class MovieInfoItem extends StatelessWidget {
  final String title;
  final Icon itemIcon;
  const MovieInfoItem({required this.title, required this.itemIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        itemIcon,
        Text(
          title,
          style: TextStyle(
            color: CustomColors.textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
