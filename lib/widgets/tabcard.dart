import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:intl/intl.dart';

class TabCard extends StatefulWidget {
  final String status;
  final String period;
  final String type;
  const TabCard(
      {Key? key,
      required this.status,
      required this.period,
      required this.type})
      : super(key: key);

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              LabelTxt(
                text: widget.period,
                size: 12,
                color: Colors.grey,
              ),
              SizedBox(
                width: 150,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.status == "Declined"
                      ? Colors.red.withOpacity(0.3)
                      : widget.status == "Approuved"
                          ? Colors.green.withOpacity(0.3)
                          : Colors.amber.withOpacity(0.3)
                    ..withOpacity(0.3),
                ),
                child: LabelTxt(
                  text: widget.status,
                  size: 12,
                  color: widget.status == "Declined"
                      ? Colors.red
                      : widget.status == "Approuved"
                          ? Colors.green
                          : Colors.amber,
                  fn: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelTxt(
                      text: DateFormat.yMMMEd().format(DateTime.now()),
                      size: 20,
                      fn: FontWeight.w600),
                  LabelTxt(
                    text: widget.type,
                    size: 12,
                    color: widget.type == "Casual"
                        ? Color(0xff770987)
                        : Color(0xff2F58CD),
                    fn: FontWeight.w600,
                  )
                ],
              ),
              SizedBox(
                width: 130,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.grey,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
