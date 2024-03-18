import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String subject;
  final String subTitle;
  final int value;
  final String valueSubject;
  final VoidCallback onTap;
  const SubjectCard(
      {super.key,
      required this.subject,
      required this.subTitle,
      required this.value,
      required this.valueSubject,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Constants.width(context),
          height: Constants.height(context) * 0.09,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.cardColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      valueSubject,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
