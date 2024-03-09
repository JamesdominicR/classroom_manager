import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_details_widget.dart';
import 'package:flutter/material.dart';

class SubjectDetailScreen extends StatelessWidget {
  const SubjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppbar(),
      body: SafeArea(
          child: SubjectDetailsWidget(
        subjectTitle: StringConstants.SUBJECT_DETAIL,
        name: "History",
        secondaryTitle: "Branda Miller",
        tertiaryTitle: "credit : 10",
      )),
    );
  }
}
