import 'dart:convert';

StudentDetailModel studentDetailModelFromJson(String str) => StudentDetailModel.fromJson(json.decode(str));

String studentDetailModelToJson(StudentDetailModel data) => json.encode(data.toJson());

class StudentDetailModel {
    int? age;
    String? email;
    int? id;
    String? name;

    StudentDetailModel({
        this.age,
        this.email,
        this.id,
        this.name,
    });

    factory StudentDetailModel.fromJson(Map<String, dynamic> json) => StudentDetailModel(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
    };
}