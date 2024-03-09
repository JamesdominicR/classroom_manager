import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/assets.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/class_room/class_room_provider.dart';
import 'package:classroom_manager/view/class_rooms/widgets/classroom_detail_card_widget.dart';
import 'package:classroom_manager/view/subjects/subject_screen.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassRoomDetailScreen extends StatelessWidget {
  final int? id;
  const ClassRoomDetailScreen({super.key,this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  StringConstants.CLASSROOM_DETAILS,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Constants.pheight04(context),
              Consumer<ClassRoomProvider>(
                builder: (context,classRoomProvider,_) {
                  classRoomProvider.getClassroomDetails(id ?? 0);
                  return 
                 ClassroomDetailCardWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubjectScreen(addSubject: true)));
                    },
                    title: classRoomProvider.classroomDetailModel.subject?.isNotEmpty == true
                    ? classRoomProvider.classroomDetailModel.subject ?? ""
                    : StringConstants.ADD_SUBJECT,
                     
                    buttonTitle: classRoomProvider.classroomDetailModel.subject?.isNotEmpty == true
                    ? StringConstants.CHANGE
                    : StringConstants.ADD 
                  );
                }
              ),
              Constants.pheight08(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: List.generate(
                      8,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(Assets.IC_STUDENT_LEFT),
                      ),
                    ),
                  ),
                  Container(
                    height: Constants.height(context) * 0.55,
                    width: Constants.width(context) * 0.35,
                    color: AppColor.cardColor,
                  ),
                  Column(
                    children: List.generate(
                      8,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          Assets.IC_STUDENT_RIGHT,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
