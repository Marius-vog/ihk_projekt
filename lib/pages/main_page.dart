import 'package:flutter/material.dart';

import 'package:ihk_projekt/models/api_app.dart';
import 'package:ihk_projekt/pages/app_overview_page.dart';
import 'package:ihk_projekt/pages/quickstart_information.dart';
import 'package:ihk_projekt/widgets/api_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).textSelectionColor,
                size: 35.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Your GCP Quickstart",
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
          QuickstartInfo(height: height, width: width),
          Chapter(
            title: "Try out APIs",
            route: AppOverView.routeName,
          ),
          Container(
            height: height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: apiApps.length,
              itemBuilder: (context, index) => ApiWidget(apiApps[index]),
            ),
          ),
          Chapter(
            title: "Control the GCP",
          ),
        ],
      ),
    ));
  }
}

class Chapter extends StatelessWidget {
  final String title;
  final String route;
  const Chapter({
    Key key,
    this.title,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w800),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30),
        child: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).pushNamed(route)),
      )
    ]);
  }
}

class QuickstartInfo extends StatelessWidget {
  const QuickstartInfo({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      height: height * 0.15,
      width: width * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to your Quickstart into the Google Cloud",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "You can test APIs, control a GCP Project or get information about the GCP Quickstart offer itself",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(QuickstartInformation.routeName),
                    child: Text("Learn more",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
