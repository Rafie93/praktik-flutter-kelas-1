import 'dart:convert';

import 'package:http/http.dart' as http;

class JobUserResponse {
  String nama;
  String pekerjaan;
  String id;
  String tanggal;

  JobUserResponse({
    required this.nama,
    required this.pekerjaan,
    required this.id,
    required this.tanggal,
  });

  static Future<JobUserResponse> kirimDataJobUser(
      String nama, String pekerjaan) async {
    var url = Uri.parse("https://reqres.in/api/users");
    var apiResponse = await http.post(url, body: {
      "name": nama,
      "job": pekerjaan,
    });

    var jsonData = json.decode(apiResponse.body);
    return JobUserResponse.jobResponse(jsonData);
  }

  factory JobUserResponse.jobResponse(Map<String, dynamic> json) {
    return JobUserResponse(
      nama: json['name'],
      pekerjaan: json['job'],
      id: json['id'].toString(),
      tanggal: json['createdAt'],
    );
  }
}
