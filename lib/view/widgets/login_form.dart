import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model/api/api_response.dart';
import 'package:royal_travel/model_view/auth_model_view.dart';
import 'package:royal_travel/theme.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

String? email;
String? password;

class _LoginFormState extends State<LoginForm> {
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ApiResponse apiResponse =
        Provider.of<AuthModelView>(context).response;

    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) => email = value,
                decoration: AppTheme.inputDecoration.copyWith(
                    prefixIconConstraints: BoxConstraints(minWidth: 70),
                    prefixIcon: Icon(
                      Icons.email,
                      size: 40,
                      color: Colors.indigo,
                    ),
                    hintText: "Email"),
                cursorColor: Colors.indigo,
                style: AppTheme.fieldText,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) => password = value,
                decoration: AppTheme.inputDecoration.copyWith(
                    prefixIconConstraints: BoxConstraints(minWidth: 70),
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 40,
                      color: Colors.indigo,
                    ),
                    hintText: "Password"),
                cursorColor: Colors.indigo,
                style: AppTheme.fieldText,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              apiResponse.status == Status.LOADING
                  ? Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          apiResponse.message.toString(),
                          style: AppTheme.subTitle1,
                        )
                      ],
                    )
                  : InkWell(
                      onTap: () async {
                        await Provider.of<AuthModelView>(context, listen: false)
                            .login(email!, password!)
                            .then((value) {
                          if (apiResponse.data == true) {
                            Navigator.of(context).pushNamed("/navigation");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(apiResponse.message.toString())));
                          }
                        });
                      },
                      child: Container(
                          color: Colors.deepOrange,
                          width: 120,
                          child: Center(
                            child: Text(
                              "LOGIN >",
                              style: AppTheme.buttonText.copyWith(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                          )),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Signup now !",
                      style: AppTheme.buttonText.copyWith(color: Colors.indigo),
                    )),
              ),
            ],
          ),
        ));
  }
}
