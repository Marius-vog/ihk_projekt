import 'package:flutter/material.dart';
import 'package:ihk_projekt/models/api_app.dart';
import 'package:ihk_projekt/widgets/api_widget.dart';

class AppOverView extends StatelessWidget {
  static String routeName = "/appOverview";
  const AppOverView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Try out APIs",
                style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width * 0.9,
              height: height * 0.8,
              child: GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: apiApps.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 20),
                  itemBuilder: (context, index) => ApiWidget(apiApps[index])),
            ),
          ),
        ],
      ),
    );
  }
}
