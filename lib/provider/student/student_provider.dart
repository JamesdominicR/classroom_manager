import 'dart:developer';
import 'package:classroom_manager/data/models/student_detail_model.dart';
import 'package:classroom_manager/data/models/student_model.dart';
import 'package:classroom_manager/services/api_service.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> studentList = <Student>[];
  StudentDetailModel studentDetailModel = StudentDetailModel();

  Future<void> getStudent() async {
    try {
      final response = await ApiService().getStudent();
      studentList.clear();
      if (response?.statusCode == 200) {
        final studentListModel = StudentModel.fromJson(response?.data);

        studentList.addAll(studentListModel.students.toList());
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getStudentDetails(int id) async {
    try {
      final response = await ApiService().getStudentDetails(id);
      if (response?.statusCode == 200) {
        final studentModel = StudentDetailModel.fromJson(response?.data);

        studentDetailModel = studentModel;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
