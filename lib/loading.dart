import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
        height: size.height,
        color:  Colors.brown[100],
        child: SpinKitSpinningLines(
          size: size.width*0.4,

          color: Colors.brown,
        )
      );
  }
}
