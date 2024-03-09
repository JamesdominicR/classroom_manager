import 'dart:developer';
import 'package:classroom_manager/data/models/subject_detail_model.dart';
import 'package:classroom_manager/data/models/subject_model.dart';
import 'package:classroom_manager/services/api_service.dart';
import 'package:flutter/material.dart';

class SubjectProvider extends ChangeNotifier {
  List<Subject> subjectList = <Subject>[];
  SubjectDetailModel subjectDetailModel = SubjectDetailModel();

  Future<void> getSubject() async {
    try {
      final response = await ApiService().getSubject();
      subjectList.clear();
      if (response?.statusCode == 200) {
        final subjectModel = SubjectModel.fromJson(response?.data);

        subjectList.addAll(subjectModel.subjects);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getSubjectDetails(int id) async {
    try {
      final response = await ApiService().getSubjectDetails(id);
      if (response?.statusCode == 200) {
        final subjectModel = SubjectDetailModel.fromJson(response?.data);

        subjectDetailModel = subjectModel;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
