import 'package:flutter/material.dart';
import 'package:ihk_projekt/models/api_app.dart';

class ApiWidget extends StatelessWidget {
  Icon icon = Icon(Icons.remove_red_eye);
  String name;
  String apiName;
  String route;
  Color color;

  ApiWidget(ApiApp app) {
    this.icon = app.icon;
    this.name = app.name;
    this.apiName = app.apiName;
    this.route = app.route;
    this.color = app.color;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(this.route);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
              color: this.color,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          width: width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: height * 0.05,
                    width: height * 0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDADADA).withOpacity(0.5),
                    ),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    Text(this.apiName, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
