import 'dart:convert';

ClassRoomDetailModel classRoomDetailModelFromJson(String str) => ClassRoomDetailModel.fromJson(json.decode(str));

String classRoomDetailModelToJson(ClassRoomDetailModel data) => json.encode(data.toJson());

class ClassRoomDetailModel {
    int? id;
    String? layout;
    String? name;
    int? size;
    String? subject;

    ClassRoomDetailModel({
         this.id,
         this.layout,
         this.name,
         this.size,
         this.subject,
    });

    factory ClassRoomDetailModel.fromJson(Map<String, dynamic> json) => ClassRoomDetailModel(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subject,
    };
}