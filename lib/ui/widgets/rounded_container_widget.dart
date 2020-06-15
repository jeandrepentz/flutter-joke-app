import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color backgroundColor;
  const RoundedContainerWidget({
    Key key, 
    @required this.child, 
    this.padding = const EdgeInsets.all(16), 
    this.borderRadius = 5,
    this.backgroundColor,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child);
  }
}
