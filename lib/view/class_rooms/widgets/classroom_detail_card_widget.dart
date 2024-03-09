import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ClassroomDetailCardWidget extends StatelessWidget {
  const ClassroomDetailCardWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onTap,
  });
  final String title;
  final String buttonTitle;
  final VoidCallback onTap;

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
            InkWell(
              onTap: onTap,
              child: Container(
                height: Constants.height(context) * 0.05,
                width: Constants.width(context) * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.secondaryButtonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Center(
                      child: Text(
                    buttonTitle,
                    style: const TextStyle(
                      color: AppColor.primaryButtonColor,
                      fontSize: 12,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
