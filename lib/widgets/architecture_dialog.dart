import 'package:flutter/material.dart';

class ArchitectureDialog extends StatelessWidget {
  final Image image;
  const ArchitectureDialog({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Architecture"),
      content: Image(
        image: AssetImage('assets/architecture.png'),
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Close"),
        )
      ],
    );
  }
}
