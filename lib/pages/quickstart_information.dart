import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:ihk_projekt/models/faq.dart';

class QuickstartInformation extends StatelessWidget {
  static String routeName = "/quickstartOverview";
  const QuickstartInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: heigt,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Topic(
                  text: "Your GCP Quickstart",
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "The GCP Quickstart offer by Atos gives you the perfect opportunity to get you started ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400),
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
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          header: Text(
                            key,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
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
        Topic(
          text: "What you will get",
        )
      ],
    );
  }
}
