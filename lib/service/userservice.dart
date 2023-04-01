import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../hosts.dart';

abstract class UserService {
  static Future<http.Response> login(String email, String password) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl + "/auth/authenticate"),
        headers: {"Content-type": "application/json"},
        body: json.encode({"email": email, "password": password}));
  }

  static Future<http.Response> logout(String token) async {
    return await http.delete(Uri.parse(Hosts.gatewayUrl + "/logout"),
        headers: {"Content-type": "application/json", "Token": token});
  }

  static Future<http.Response> post(String token, employeId) async {
    return await http.post(
        Uri.parse(Hosts.gatewayUrl + "/employe/" + employeId),
        headers: {"Content-type": "application/json", "Token": token});
  }

  static Future<http.Response> get(String token, String employeId) async {
    return await http.get(Uri.parse(Hosts.gatewayUrl + "/employe/" + employeId),
        headers: {"Content-type": "application/json", "Token": token});
  }

  static Future<http.Response> getAll(String token) async {
    return await http.get(Uri.parse(Hosts.gatewayUrl + "/employe"),
        headers: {"Content-type": "application/json", "Token": token});
  }
}
