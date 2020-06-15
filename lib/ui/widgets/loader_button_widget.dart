import 'package:flutter/material.dart';

class LoaderButtonWidget extends StatefulWidget {
  //TODO: Add all other properties of the RaisedButton Widget
  final Widget child;
  final Function onPressed;
  final Color color;
  LoaderButtonWidget({
    Key key, 
    @required this.child, 
    @required this.onPressed,
    this.color
    }) : super(key: key);

  @override
  _LoaderButtonWidgetState createState() => _LoaderButtonWidgetState();
}

class _LoaderButtonWidgetState extends State<LoaderButtonWidget> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: isloading ? _loadingChild() : widget.child,
      onPressed: _onPress,
      color: widget.color,
    );
  }

  Widget _loadingChild() {
    return Container(
      height: 20,
      width:20,
      child: CircularProgressIndicator(
      )
      );
  }

  _onPress() async {
    if (isloading) return; //still busy don't do anything
    _startLoading();
    await widget.onPressed();
    _stopLoading();
  }

  _startLoading() {
    //the if is to make sure the button has been disposed (possibly due to navigation)
    if (this.mounted) {
      setState(() {
        isloading = true;
      });
    }
  }

  _stopLoading() {
    //the if is to make sure the button has been disposed (possibly due to navigation)
    if (this.mounted) {
      setState(() {
        isloading = false;
      });
    }
  }
}
