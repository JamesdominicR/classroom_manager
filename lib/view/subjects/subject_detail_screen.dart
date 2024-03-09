import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/subject/subject_provider.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectDetailScreen extends StatelessWidget {
  final int id;
  const SubjectDetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Consumer<SubjectProvider>(
            builder: (context,subjectProvider,_) {
              subjectProvider.getSubjectDetails(id);
              return subjectProvider.subjectDetailModel.name != null
              ? SubjectDetailsWidget(
                      subjectTitle: StringConstants.SUBJECT_DETAIL,
                      name: subjectProvider.subjectDetailModel.name ?? "",
                      secondaryTitle: subjectProvider.subjectDetailModel.teacher ?? "",
                      tertiaryTitle: "${StringConstants.CREDIT} : ${subjectProvider.subjectDetailModel.credits}",
                    )
                    : const Center(child: Text(StringConstants.NO_DATA));
            }
          )),
    );
  }
}
