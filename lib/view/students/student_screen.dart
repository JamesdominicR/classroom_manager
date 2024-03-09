import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/student/student_provider.dart';
import 'package:classroom_manager/view/students/student_detail_screen.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  late StudentProvider studentProvider;
  @override
  void initState() {
    studentProvider = context.read<StudentProvider>();
    studentProvider.getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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
                StringConstants.STUDENTS,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Constants.pheight03(context),
            Consumer<StudentProvider>(builder: (context, studentProvider, _) {
              return Expanded(
                  child: studentProvider.studentList.isNotEmpty == true 
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: studentProvider.studentList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              StudentDetailScreen(
                                                id: studentProvider
                                                    .studentList[index].id,
                                              )));
                                },
                                child: Container(
                                  width: Constants.width(context),
                                  height: Constants.height(context) * 0.09,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.cardColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        bottom: 12,
                                        top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              studentProvider
                                                  .studentList[index].name,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              studentProvider
                                                  .studentList[index].email,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${StringConstants.AGE}: ${studentProvider.studentList[index].age}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : const Text(StringConstants.NO_DATA));
            })
          ],
        ),
      )),
    );
  }
}
