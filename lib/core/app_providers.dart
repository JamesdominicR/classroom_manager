import 'package:classroom_manager/provider/class_room/class_room_provider.dart';
import 'package:classroom_manager/provider/home/home_provider.dart';
import 'package:classroom_manager/provider/student/student_provider.dart';
import 'package:classroom_manager/provider/subject/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<StudentProvider>(
            create: (context) => StudentProvider()),
        ChangeNotifierProvider<SubjectProvider>(
            create: (context) => SubjectProvider()),
        ChangeNotifierProvider<ClassRoomProvider>(
            create: (context) => ClassRoomProvider()),
      ],
      child: child,
    );
  }
}
