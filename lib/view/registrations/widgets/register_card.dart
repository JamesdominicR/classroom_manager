import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:flutter/material.dart';

class RegisterCard extends StatelessWidget {
  final String title;
  const RegisterCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width(context),
      height: Constants.height(context) * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
