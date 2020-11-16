// import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  final List<String> faq;
  // final int i;

  FaqItem(this.faq);

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  List<Widget> list = List<Widget>();

  Widget getText() {
    for (var l = 1; l < widget.faq.length; l++) {
      list.add(
        Text(
          widget.faq[l],
          style: TextStyle(
            fontSize: 13,
            // fontStyle: FontStyle.italic,
          ),
        ),
      );
    }
    return Column(
      children: list,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ExpansionTile(
        title: Text(
          widget.faq[0],
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        childrenPadding: const EdgeInsets.all(8.0),
        children: <Widget>[
          getText(),
        ],
      ),
    );
  }
}
