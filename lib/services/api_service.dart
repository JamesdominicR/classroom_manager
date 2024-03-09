import 'package:classroom_manager/services/api_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(baseUrl: ApiClient.BASE_URL),
  );

  Future<Response<dynamic>?> getStudent() async {
    final response = await dio.get(ApiClient.STUDENT,
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> getStudentDetails(int id) async {
    final response = await dio.get("${ApiClient.STUDENT}$id",
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> getSubject() async {
    final response = await dio.get(ApiClient.SUBJECT,
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> getSubjectDetails(int id) async {
    final response = await dio.get("${ApiClient.SUBJECT}$id",
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> getClassroom() async {
    final response = await dio.get(ApiClient.CLASSROOM,
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> getClassroomDetails(int id) async {
    final response = await dio.get("${ApiClient.CLASSROOM}$id",
        queryParameters: {"api_key": ApiClient.API_KEY});

    return response;
  }

  Future<Response<dynamic>?> classRoomUpdate(
      int classroomId, int subjectId) async {
    final response = await dio.patch("${ApiClient.CLASSROOM}$classroomId",
        queryParameters: {"api_key": ApiClient.API_KEY, "subject": subjectId});

    return response;
  }
}
