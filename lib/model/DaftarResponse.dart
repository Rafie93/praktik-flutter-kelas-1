import 'dart:convert';
import 'package:http/http.dart' as http;

class DaftarResponse {
  String nama;
  String pekerjaan;
  String id;
  String createdAt;

  DaftarResponse({
    required this.nama,
    required this.pekerjaan,
    required this.id,
    required this.createdAt,
  });

  static Future<DaftarResponse> kirimDataKeAPI(
      String nama, String pekerjaan) async {
    var url = Uri.parse('https://reqres.in/api/users');
    var result = await http.post(url, body: {
      'name': nama,
      'job': pekerjaan,
    });

    var jsonData = json.decode(result.body);
    return DaftarResponse.createDaftarResponse(jsonData);
  }

  factory DaftarResponse.createDaftarResponse(Map<String, dynamic> json) {
    return DaftarResponse(
      nama: json['name'],
      pekerjaan: json['job'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }
}
