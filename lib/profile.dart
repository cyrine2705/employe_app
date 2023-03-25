import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_employe/widgets/label.dart';

import 'widgets/profileListItem.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 30),
              Icon(
                FontAwesomeIcons.arrowLeft,
                size: (30),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 3),
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/image/nedra.jpg'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    LabelTxt(
                      text: "Nedra Ghdamsi",
                      size: 20,
                      fn: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    LabelTxt(text: "nedra@gmail.com", size: 14),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Center(
                        child: LabelTxt(text: "edit profile", size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 45),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: FontAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.doorOpen,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
