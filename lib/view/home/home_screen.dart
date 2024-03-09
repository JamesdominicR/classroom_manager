import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/provider/home/home_provider.dart';
import 'package:classroom_manager/view/class_rooms/class_room_screen.dart';
import 'package:classroom_manager/view/registrations/registration_screen.dart';
import 'package:classroom_manager/view/students/student_screen.dart';
import 'package:classroom_manager/view/subjects/subject_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    StringConstants.HELLO,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Icon(
                    Icons.menu,
                    size: 30,
                  )
                ],
              ),
              const Text(
                StringConstants.GOOD_MORNING,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Constants.pheight08(context),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: Constants.height(context) * 0.04,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 3.8 / 4.8,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeProvider.classroomList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigation(context, index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: homeProvider.classroomList[index].color,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                                homeProvider.classroomList[index].icon ?? ""),
                            Constants.pheight02(context),
                            Text(
                              homeProvider.classroomList[index].title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  navigation(BuildContext context, index) {
    switch (index) {
      case 0:
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const StudentScreen()));
      case 1:
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const SubjectScreen()));
      case 2:
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const ClassRoomScreen()));
      case 3:
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const RegistrationScreen()));
    }
  }
}
