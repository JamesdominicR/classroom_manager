import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/class_room/class_room_provider.dart';
import 'package:classroom_manager/view/class_rooms/class_room_detail_screen.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:classroom_manager/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({super.key});

  @override
  State<ClassRoomScreen> createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  late ClassRoomProvider classRoomProvider;
  @override
  void initState() {
    classRoomProvider = context.read<ClassRoomProvider>();
    classRoomProvider.getClassroom();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                StringConstants.CLASS_ROOMS,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Constants.pheight03(context),
            Consumer<ClassRoomProvider>(
              builder: (context,classRoomProvider,_) {
                return classRoomProvider.classroomList.isNotEmpty == true
               ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: classRoomProvider.classroomList.length,
                      itemBuilder: (context, index) {
                        return SubjectCard(
                            subject: classRoomProvider.classroomList[index].name,
                            subTitle: classRoomProvider.classroomList[index].layout,
                            value: classRoomProvider.classroomList[index].size,
                            valueSubject: StringConstants.CREDIT,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClassRoomDetailScreen(id: classRoomProvider.classroomList[index].id)));
                            });
                      }),
                )
                : const Center(child: Text(StringConstants.NO_DATA));
              }
            )
          ],
        ),
      )),
    );
  }
}
