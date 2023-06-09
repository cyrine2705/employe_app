import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/home.dart';
import 'package:app_employe/overview.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:app_employe/widgets/input.dart';
import 'package:app_employe/widgets/label.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.paperPlane,
                        size: 30,
                        color: Color(0Xff4E31AA),
                      ),
                      LabelTxt(
                        text: "|Bee ",
                        size: 20.0,
                      ),
                    ],
                  ),
                  LabelTxt(
                    text: "Sign in ",
                    size: 40.0,
                    fn: FontWeight.w600,
                  ),
                  LabelTxt(
                    text: "Enter your informations and get started",
                    size: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, left: 50, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelTxt(
                          text: "Email*",
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        InputText(
                          hint: 'example@gmail.com',
                          ic: Icons.email,
                          controller: userController,
                        ),
                        SizedBox(height: Get.height * 0.005),
                        LabelTxt(
                          text: "Password*",
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        InputText(
                          obscure: true,
                          hint: '********',
                          ic: Icons.key,
                          controller: pwdController,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {},
                          child: Text('forgot password ?'),
                        ),
                        Center(
                          child: button(
                              width: 250,
                              text: 'Sign in',
                              fct: () {
                                setState(() {
                                  login();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() {
    String user = "nedra@gmail.com";
    String pwd = "ghdamsi";
    if (userController.text.isEmpty || pwdController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email and password',
          snackPosition: SnackPosition.BOTTOM);
    } else if (userController.text == user && pwdController.text == pwd) {
      userController.clear();
      pwdController.clear();
      Get.to(() => Home());
    } else if (!GetUtils.isEmail(userController.text)) {
      Get.snackbar('Error', 'Incorrect email ',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Incorrect email or password ',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
