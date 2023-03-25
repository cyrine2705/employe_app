import 'package:app_employe/widgets/label.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10 * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: 10 * 4,
      ).copyWith(
        bottom: 10 * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10 * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 10 * 2.5,
          ),
          SizedBox(width: 10 * 1.5),
          LabelTxt(
            text: this.text,
            size: 20,
            fn: FontWeight.w500,
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              FontAwesomeIcons.angleRight,
              size: 10 * 2.5,
            ),
        ],
      ),
    );
  }
}
