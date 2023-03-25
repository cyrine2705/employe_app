import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/demande-cong.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:intl/intl.dart';
import 'package:app_employe/widgets/tabcard.dart';

class ListConge extends StatefulWidget {
  const ListConge({super.key});

  @override
  State<ListConge> createState() => _ListCongeState();
}

class _ListCongeState extends State<ListConge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(Demande_cong());
                    },
                    icon: Icon(FontAwesomeIcons.solidSquarePlus,
                        color: Color(0xff3A1078), size: 45)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelTxt(
                    text: "Leaves ",
                    size: 40.0,
                    fn: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // Creates border
                          color: Color(0xffCBC0D3)),
                      tabs: [
                        Tab(
                          child: LabelTxt(
                            text: "All",
                            size: 16,
                            color: Colors.black,
                            fn: FontWeight.w600,
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xff770987),
                                size: 10,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              LabelTxt(
                                text: "Casual",
                                size: 16,
                                color: Colors.black,
                                fn: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidCircle,
                                color: Color(0xff2F58CD),
                                size: 10,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              LabelTxt(
                                text: "Sick",
                                size: 16,
                                color: Colors.black,
                                fn: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    width: 500,
                    child: TabBarView(
                      viewportFraction: 1.0,
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TabCard(
                                status: "Approuved",
                                period: "3 days application",
                                type: "Casual"),
                            SizedBox(
                              height: 10,
                            ),
                            TabCard(
                                status: "Declined",
                                period: "3 days application",
                                type: "Casual"),
                            SizedBox(
                              height: 10,
                            ),
                            TabCard(
                                status: "Awaiting",
                                period: "3 days application",
                                type: "Sick"),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TabCard(
                                status: "Declined",
                                period: "3 days application",
                                type: "Casual"),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TabCard(
                                status: "Awaiting",
                                period: "3 days application",
                                type: "Sick"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            childCount: 1,
          ),
        )
      ])),
    ));
  }
}
