import 'package:classroom_manager/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  const ButtonWidget(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.height(context) * 0.065,
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      child: Text(title,
      style: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
      )),
    );
  }
}
