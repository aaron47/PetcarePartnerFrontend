import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/forgot_password_screen.dart';
import 'package:pet_patner_demo/screens/otp_verification_screen.dart';
import 'package:pet_patner_demo/screens/signup_screen.dart';

import '../controllers/ApiController.dart';
import '../widgets/bottomnavigationbar.dart';

class LoginScreen extends BaseRoute {
  LoginScreen({a, o}) : super(a: a, o: o, r: 'LoginScreen');

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRouteState {
  bool _showPassword = false;
  var _fPassword = new FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this key
  final ApiController apiController = Get.put(ApiController());

  bool _isValidEmail(String value) {
    // You can implement your own email validation logic here
    // For simplicity, I'm using a basic pattern match
    final pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  _LoginScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/partnerbaner.jpg'),
                    ),
                  ),
                ),
              ]),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _emailController,
                          autofocus: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!_isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_fPassword);
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email",
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _fPassword,
                          obscureText: !_showPassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre mot de passe';
                            }
                            if (value.length < 6) {
                              return 'Le mot de passe doit contenir au moins 6 caractères';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context).lbl_password,
                            hintText: AppLocalizations.of(context).hnt_password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => TextButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                var response = await apiController.loginUser(
                                    _emailController.text,
                                    _passwordController.text);

                                if (response.status == false) {
                                  MotionToast(
                                    icon: Icons.warning,
                                    primaryColor: Colors.red,
                                    title: Text("Error de connection"),
                                    description: Text(
                                        "Votre email ou mot de passe sont incorrectes!"),
                                    width: 300,
                                    height: 100,
                                  ).show(context);
                                  return;
                                }

                                MotionToast(
                                    icon: Icons.verified,
                                    primaryColor: Colors.green,
                                    title: Text("Succès"),
                                    description:
                                        Text("Vous êtes connectè avec succès!"),
                                    width: 300,
                                    height: 100,
                                    onClose: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Bottomnavigationbar()),
                                      );
                                    }).show(context);
                              },
                              child: apiController.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Text(
                                      AppLocalizations.of(context).lbl_login,
                                    )),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: InkWell(
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .lbl_forgot_password,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText2,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .txt_dont_have_account,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1),
                                  InkWell(
                                    child: Text(
                                      AppLocalizations.of(context).lbl_signup,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText2,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
