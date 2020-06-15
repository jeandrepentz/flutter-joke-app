import 'package:flutter/material.dart';

class IconButtonWithLabelWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color iconColor;
  final Color labelColor;
  final Function onPressed;
  const IconButtonWithLabelWidget({Key key, this.iconData, this.label, this.iconColor, this.labelColor, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Using GestureDetector instead of the onPressed of the button so taps on the Text also triggers the onPressed method
    return GestureDetector(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(iconData, color: iconColor),
            onPressed: null,
          ),
          Text(
            label ?? "",
            style: TextStyle(color: labelColor),
          )
        ],
      ),
      onTap: onPressed,
    );
  }
}
