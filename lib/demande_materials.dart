import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/home.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:app_employe/widgets/label.dart';

class Demande_mat extends StatefulWidget {
  const Demande_mat({super.key});

  @override
  State<Demande_mat> createState() => _Demande_matState();
}

class _Demande_matState extends State<Demande_mat> {
  TextEditingController dateInputController = TextEditingController();
  String dropdownvalue = '  casual  ';
  var items = [
    '  casual  ',
    '  travel  ',
    '  sick    ',
    '  other   ',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackButton(),
                LabelTxt(
                    text: "Request material", size: 30, fn: FontWeight.w600),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: <Widget>[
                        Row(children: [
                          Icon(
                            FontAwesomeIcons.calendarDay,
                            size: 30,
                            color: Color(0xff3A1078),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 180,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Pick a date",
                              ),
                              controller: dateInputController,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050));

                                if (pickedDate != null) {
                                  dateInputController.text =
                                      pickedDate.toString();
                                }
                              },
                            ),
                          )
                        ]),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(children: [
                          Icon(
                            FontAwesomeIcons.box,
                            size: 30,
                            color: Color(0xff3A1078),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTxt(
                                text: "Material",
                                size: 12,
                                color: Colors.grey,
                              ),
                              DropdownButton(
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          )
                        ]),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidPenToSquare,
                                size: 30,
                                color: Color(0xff3A1078),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelTxt(
                                    text: "Cause",
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 280,
                                    height: 200,
                                    child: TextField(
                                      maxLines: 8,
                                      decoration: InputDecoration.collapsed(
                                        hintText:
                                            "why you need that material.......",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: button(
                        width: 150, text: "Send", fct: () => Get.to(Home())))
              ],
            )),
      ),
    );
  }
}
