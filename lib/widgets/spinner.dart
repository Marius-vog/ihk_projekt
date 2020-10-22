import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoolSpinner extends StatelessWidget {
  final Color spinnerColor;
  final double size;
  CoolSpinner(this.spinnerColor, [this.size]);
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: spinnerColor,
          ),
        );
      },
    );
  }
}
