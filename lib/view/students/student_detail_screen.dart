import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_details_widget.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppbar(),
      body: SafeArea(
          child: SubjectDetailsWidget(
        subjectTitle: "Student Detail",
        name: "Lourie Thomas",
        secondaryTitle: "Age : 22",
        tertiaryTitle: "louriethomas@example.com",
      )),
    );
  }
}
