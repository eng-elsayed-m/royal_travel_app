import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const nv = "/setting";
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Settings"),
      ),
    );
  }
}
