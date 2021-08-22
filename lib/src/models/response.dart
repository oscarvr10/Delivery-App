import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());


class Response {
  bool success = false;
  String? message = '';
  String? error = '';
  dynamic data;

  Response({
    required this.success,
    this.message,
    this.error,
    this.data,
  });

  Response.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    error = json["error"];
    try {
      data = json["data"];
    } catch (e) {
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "error": error,
    "data": data,
  };
}
