import 'dart:math';

import 'package:flutter/material.dart';
import 'package:royal_travel/theme.dart';
import 'package:royal_travel/view/widgets/login_form.dart';
import 'package:royal_travel/view/widgets/logo_widget.dart';

class IntroScreen extends StatelessWidget {
  static const nV = "/intro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.center,
                    end: AlignmentDirectional.bottomEnd,
                    stops: [
                  0.8,
                  0.2
                ],
                    colors: [
                  const Color(0xFFFFFFFF),
                  Theme.of(context).primaryColor
                ])),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: LogoWidget(const Size(220, 220)),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 12,
                            child: Container(
                              transform: Matrix4.rotationZ(0.75),
                              width: 50,
                              height: 50,
                              color: Colors.deepOrange.withOpacity(0.8),
                            )),
                        Text(
                          "Royal Travel",
                          style: AppTheme.mainTitle,
                        ),
                      ],
                    )),
                LoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
