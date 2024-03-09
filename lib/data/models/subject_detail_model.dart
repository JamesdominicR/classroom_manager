import 'dart:convert';

SubjectDetailModel subjectDetailModelFromJson(String str) => SubjectDetailModel.fromJson(json.decode(str));

String subjectDetailModelToJson(SubjectDetailModel data) => json.encode(data.toJson());

class SubjectDetailModel {
    int? credits;
    int? id;
    String? name;
    String? teacher;

    SubjectDetailModel({
        this.credits,
        this.id,
        this.name,
        this.teacher,
    });

    factory SubjectDetailModel.fromJson(Map<String, dynamic> json) => SubjectDetailModel(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
    );

    Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
    };
}
