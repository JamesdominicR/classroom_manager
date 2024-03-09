import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/student/student_provider.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentDetailScreen extends StatelessWidget {
  final int id;
  const StudentDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(child:
          Consumer<StudentProvider>(builder: (context, studentProvider, _) {
        studentProvider.getStudentDetails(id);
        return studentProvider.studentDetailModel.name != null
            ? SubjectDetailsWidget(
                subjectTitle: StringConstants.STUDENT_DETAIL,
                name: studentProvider.studentDetailModel.name ?? "",
                secondaryTitle:
                    "${StringConstants.AGE} : ${studentProvider.studentDetailModel.age}",
                tertiaryTitle: studentProvider.studentDetailModel.email ?? "",
              )
            : const Center(child: Text(StringConstants.NO_DATA));
      })),
    );
  }
}
