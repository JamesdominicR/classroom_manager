import 'dart:developer';
import 'package:classroom_manager/data/models/class_room_model.dart';
import 'package:classroom_manager/data/models/classroom_detail_model.dart';
import 'package:classroom_manager/services/api_service.dart';
import 'package:flutter/material.dart';

class ClassRoomProvider extends ChangeNotifier {
  List<Classroom> classroomList = <Classroom>[];
  ClassRoomDetailModel classroomDetailModel = ClassRoomDetailModel();
  ClassRoomDetailModel classroomUpdateModel = ClassRoomDetailModel();

  Future<void> getClassroom() async {
    try {
      final response = await ApiService().getClassroom();
      classroomList.clear();
      if (response?.statusCode == 200) {
        final classRoomModel = ClassRoomModel.fromJson(response?.data);

        classroomList.addAll(classRoomModel.classrooms);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getClassroomDetails(int id) async {
    try {
      final response = await ApiService().getClassroomDetails(id);
      if (response?.statusCode == 200) {
        final classroomDetail = ClassRoomDetailModel.fromJson(response?.data);

        classroomDetailModel = classroomDetail;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> classroomUpdate(int classroomId, int subjectId) async {
    try {
      final response =
          await ApiService().classRoomUpdate(classroomId, subjectId);
      if (response?.statusCode == 200) {
        final updateModel = ClassRoomDetailModel.fromJson(response?.data);

        classroomUpdateModel = updateModel;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
