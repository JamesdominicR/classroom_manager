import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/class_room/class_room_provider.dart';
import 'package:classroom_manager/provider/subject/subject_provider.dart';
import 'package:classroom_manager/view/class_rooms/class_room_detail_screen.dart';
import 'package:classroom_manager/view/subjects/subject_detail_screen.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatefulWidget {
  final bool addSubject;
  final int? classroomId;
  const SubjectScreen({super.key,required this.addSubject,this.classroomId});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  late SubjectProvider subjectProvider;
  late ClassRoomProvider classroomProvider;
  @override
  void initState() {
    subjectProvider = context.read<SubjectProvider>();
    classroomProvider = context.read<ClassRoomProvider>();
    subjectProvider.getSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                StringConstants.SUBJECTS,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Constants.pheight03(context),
            Consumer<SubjectProvider>(builder: (context, subjectProvider, _) {
              return subjectProvider.subjectList.isNotEmpty == true
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: subjectProvider.subjectList.length,
                          itemBuilder: (context, index) {
                            return SubjectCard(
                                subject:
                                    subjectProvider.subjectList[index].name,
                                subTitle:
                                    subjectProvider.subjectList[index].teacher,
                                value:
                                    subjectProvider.subjectList[index].credits,
                                valueSubject: StringConstants.CREDIT,
                                onTap: widget.addSubject == true
                                ? () {
                                  classroomProvider.classroomUpdate(widget.classroomId ?? 0, subjectProvider.subjectList[index].id);
                                  Navigator.pop(context);
                                }
                                : () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SubjectDetailScreen(
                                                id: subjectProvider
                                                    .subjectList[index].id,
                                              )));
                                });
                          }),
                    )
                  : const Center(child: Text(StringConstants.NO_DATA));
            })
          ],
        ),
      )),
    );
  }
}
