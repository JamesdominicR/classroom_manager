import 'package:classroom_manager/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SubjectDetailsWidget extends StatelessWidget {
  final String subjectTitle;
  final String name;
  final String secondaryTitle;
  final String tertiaryTitle;
  const SubjectDetailsWidget(
      {super.key,
      required this.subjectTitle,
      required this.name,
      required this.secondaryTitle,
      required this.tertiaryTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              subjectTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Constants.pheight15(context),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Constants.pheight01(context),
          Text(
            secondaryTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Constants.pheight01(context),
          Text(
            tertiaryTitle,
            style: const TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
