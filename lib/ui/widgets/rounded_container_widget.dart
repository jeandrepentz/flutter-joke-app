import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  final Widget child;
  final double padding;
  final double borderRadius;
  final Color backgroundColor;
  const RoundedContainerWidget({
    Key key, 
    @required this.child, 
    this.padding = 16, 
    this.borderRadius = 5,
    this.backgroundColor,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child);
  }
}
