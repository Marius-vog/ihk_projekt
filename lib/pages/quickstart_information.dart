import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:ihk_projekt/models/faq.dart';

class QuickstartInformation extends StatelessWidget {
  static String routeName = "/quickstartOverview";
  const QuickstartInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Topic(
                text: "Your GCP Quickstart",
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(17),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: width * 0.8,
                  height: heigt * 0.14,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "The GCP Quickstart offer by Atos gives you the perfect opportunity to get you started ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              KeyFacts(),
              Topic(
                text: "FAQ",
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String key = questions.keys.elementAt(index);
                  return Column(
                    children: [
                      ExpandablePanel(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        header: Text(
                          key,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        expanded: Text(questions[key]),
                      ),
                      Divider(
                        color: Color(0xffB1B1B1),
                        thickness: 0.5,
                      )
                    ],
                  );
                },
                itemCount: questions.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Topic extends StatelessWidget {
  final String text;
  const Topic({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).textSelectionColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}

class KeyFacts extends StatelessWidget {
  const KeyFacts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 17.0),
          child: Topic(
            text: "What you will get",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Your own GCP organisation",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "We will setup your GCP organisation that fits your special needs. On top of that we will follow Googles best practicses to give you a secure and flexible environment",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Quickstart Workshop",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "You will recieve a hands-on workshop where we explain the bascis of GCP and cloud concepts, that are tailored to your interests",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Atos Google Experts",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "You will work with trained Atos Google Experts to get fit your needs. Additional consulting and support can be easily booked on demand.  ",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
