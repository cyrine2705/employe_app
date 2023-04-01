import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:app_employe/home.dart';
import 'package:app_employe/list_conges.dart';

import 'package:app_employe/widgets/button.dart';

import 'package:app_employe/widgets/label.dart';

class Demande_cong extends StatefulWidget {
  const Demande_cong({Key? key}) : super(key: key);

  @override
  State<Demande_cong> createState() => _Demande_congState();
}

class _Demande_congState extends State<Demande_cong> {
  TextEditingController causeInputController = TextEditingController();
  TextEditingController datefInputController = TextEditingController();
  String dropdownvalue = '  casual  ';
  var items = [
    '  casual  ',
    '  travel  ',
    '  sick    ',
    '  other   ',
  ];
  List<DateTime?> periode = [];

  File? _pickedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.single.path.toString());
      });
    }
  }

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
                LabelTxt(text: "New Leave", size: 40, fn: FontWeight.w600),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.solidRectangleList,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTxt(
                              text: "type",
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
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.solidPenToSquare,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: 100,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "cause",
                            ),
                          ),
                        )
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.circleArrowRight,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTxt(
                              text: "From",
                              size: 12,
                              color: Colors.grey,
                            ),
                            periode.toString().length < 10
                                ? LabelTxt(text: "First Day", size: 18)
                                : LabelTxt(
                                    text: periode.toString().substring(1, 11),
                                    size: 18),
                          ],
                        ),
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      CalendarDatePicker2(
                        onValueChanged: (values) => setState(
                          () => periode = values,
                        ),
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          currentDate: DateTime.now(),
                        ),
                        value: [],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.circleArrowLeft,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTxt(
                                text: "To",
                                size: 12,
                                color: Colors.grey,
                              ),
                              periode.toString().length < 26
                                  ? LabelTxt(text: "Last Day", size: 18)
                                  : LabelTxt(
                                      text:
                                          periode.toString().substring(26, 37),
                                      size: 18)
                            ]),
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        button(
                          width: 100,
                          text: "Proof",
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.elliptical(5, 5)
                                      //  bottomLeft:, bottom left
                                      // bottomRight: bottom right
                                      ))),
                          fct: () {
                            _pickFile();
                          },
                        ),
                        SizedBox(width: 15),
                        _pickedFile != null
                            ? LabelTxt(
                                text: _pickedFile.toString().substring(
                                      _pickedFile.toString().lastIndexOf("/") +
                                          1,
                                    ),
                                size: 16)
                            : LabelTxt(text: "no file", size: 16),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: button(
                        width: 150,
                        text: "Apply",
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.elliptical(10, 40)
                                    //  bottomLeft:, bottom left
                                    // bottomRight: bottom right
                                    ))),
                        fct: () => Get.to(ListConge())))
              ],
            )),
      ),
    );
  }
}
