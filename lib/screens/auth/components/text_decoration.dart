import 'package:flutter/material.dart';

class Textdecoration extends StatelessWidget {
  const Textdecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width*0.8,
      height: size.height*0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.brown[200]
      ),
      child: child,
    );
  }
}

