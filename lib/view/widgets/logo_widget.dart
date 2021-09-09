import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogoWidget extends StatelessWidget {
  final Size size;

  const LogoWidget(this.size);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/rt-logo.png",
          width: size.width,
          height: size.height,
        ),
      ],
    );
  }
}
