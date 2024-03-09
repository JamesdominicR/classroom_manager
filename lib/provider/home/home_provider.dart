import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/assets.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/data/models/common_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<CommonModel> classroomList = [
    CommonModel(
        title: StringConstants.STUDENTS,
        color: AppColor.containerPrimaryBlue,
        icon: Assets.IC_STUDENTS),
    CommonModel(
        title: StringConstants.SUBJECTS,
        color: AppColor.containerSecondaryBlue,
        icon: Assets.IC_SUBJECTS),
    CommonModel(
        title: StringConstants.CLASS_ROOMS,
        color: AppColor.containerRose,
        icon: Assets.IC_CLASS_ROOMS),
    CommonModel(
        title: StringConstants.REGISTRATION,
        color: AppColor.containerPink,
        icon: Assets.IC_REGISTRATIONS),
  ];
}
