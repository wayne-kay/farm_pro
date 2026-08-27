import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final int statusCode;
  final String message;

  const ApiException({required this.statusCode, required this.message});

  @override
  String toString() => message;
}

class ApiConstants {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://127.0.0.1:8000/api';
    }

    return 'http://10.0.2.2:8000/api';
  }
}

class ApiService {

  String _extractErrorMessage(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        final message = decoded['message'];
        final errors = decoded['errors'];

        if (errors is Map<String, dynamic> && errors.isNotEmpty) {
          final firstFieldErrors = errors.values.first;
          if (firstFieldErrors is List && firstFieldErrors.isNotEmpty) {
            return firstFieldErrors.first.toString();
          }
        }

        if (message is String && message.trim().isNotEmpty) {
          return message;
        }
      }
    } catch (_) {
      // Fall back to generic message when response is not JSON.
    }

    return 'Request failed (${response.statusCode})';
  }

  Future<dynamic> get(String endpoint,{String? token}) async {

    final response = await http.get(
      Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      headers: {
        "Accept": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) { 
      return jsonDecode(response.body);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: _extractErrorMessage(response),
      );
    }
  }

  Future<dynamic> post(
      String endpoint,
      Map<String, dynamic> body,
      {String? token}
      ) async {
    final response = await http.post(
      Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);

    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: _extractErrorMessage(response),
      );
    }
  }

  Future<dynamic> delete(String endpoint, {String? token}) async {
    final response = await http.delete(
      Uri.parse("${ApiConstants.baseUrl}$endpoint"),
      headers: {
        "Accept": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    }

    throw ApiException(
      statusCode: response.statusCode,
      message: _extractErrorMessage(response),
    );
  }

}