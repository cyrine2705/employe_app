import 'dart:io';

import 'package:app_employe/home.dart';
import 'package:app_employe/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../models/user.dart';
import '../overview.dart';
import '../service/userservice.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;
  late String? token;

  void clear() {
    _userModel.value = UserModel();
  }

  final storage = FlutterSecureStorage();

  @override
  onInit() {
    super.onInit();
  }

  void login(String email, String password) async {
    UserService.login(email, password).then((response) async {
      dynamic responseData = jsonDecode(response.body);
      print(responseData['msg']);
      if (responseData['msg'] != 'Logged In') {
        Get.snackbar(
          "Error signing in",
          responseData['msg'].toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        token = responseData['token'];
        print(token);
        await storage.write(key: 'token', value: token);
        await getData(responseData['id'], token!);
        Get.off(Home());
      }
    });
  }

  getData(String id, String token) async {
    await UserService.get(token, id).then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        user = UserModel.fromJson(responseData);
        print("this is a new user");
        print(user.toString());
      } else {
        throw Exception('Failed to fetch user');
      }
    });
  }

  changePassword(String id, String password, String newpassword) async {
    await UserService.changePassword(token!, id, password, newpassword)
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "succes",
            middleText: "your password been successfully changed!");
        getData(id, token!);
      } else {
        Get.defaultDialog(
            title: "error", middleText: "Failed change your password");
        throw Exception('Failed  to send your request' + response.body);
      }
    });
  }

  uploadfile(File file) async {
    UserService userService = UserService();
    try {
      var response = await userService.uploadFile(token!, file);
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception('Failed to upload file: ' + response.body);
      }
    } catch (e) {
      throw Exception('Failed to upload file: ' + e.toString());
    }
  }

  void updateData(String id, UserModel user) {
    UserService.updateEmploye(token!, id, user.toJson()).then((response) async {
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        user = UserModel.fromJson(responseData);
        Get.defaultDialog(
            title: "succes",
            middleText: "your data has been successfully updated!");
        update();
      } else {
        Get.defaultDialog(
            title: "error", middleText: "failed to update your data");
        throw Exception('Failed  update data' + response.body);
      }
    });
  }

  logout() {
    UserService.logout(token!).then((response) async {
      if (response.statusCode == 200) {
        print("logged out");
        clear();
        storage.delete(key: 'token');
        token = null;
        Get.to(Login());
      } else {
        print(response.body);
      }
    });
  }
}
