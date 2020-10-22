import 'package:flutter/material.dart';
import 'package:ihk_projekt/widgets/spinner.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 3,
          color: Theme.of(context).primaryColor,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: FittedBox(child: CoolSpinner(Colors.white))),
        ),
        onTap: null);
  }
}
