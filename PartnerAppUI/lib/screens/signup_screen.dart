import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/service_selection_screen.dart';

import '../Theme/native_theme.dart';
import '../controllers/ApiController.dart';
import 'login_screen.dart';

class SignupScreen extends BaseRoute {
  SignupScreen({a, o}) : super(a: a, o: o, r: 'SignupScreen');

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseRouteState {
  bool _showPassword = false;
  var _femail = new FocusNode();
  var _fPassword = new FocusNode();
  var _fUsername = new FocusNode();

  final ApiController apiController = Get.put(ApiController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this key

  final List<String> genders = ["Male", "Female"];
  String _selectedGender = "Male";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final role = "sitter";

  bool _isValidEmail(String value) {
    // You can implement your own email validation logic here
    // For simplicity, I'm using a basic pattern match
    final pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: Stack(children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/partnerbaner.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          autofocus: true,
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre numero de telephone';
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_femail);
                          },
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .lbl_email_or_mobile_no,
                            hintText: AppLocalizations.of(context)
                                .hnt_email_or_mobile_no,
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            focusNode: _femail,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre email';
                              } else if (!_isValidEmail(value)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(_fUsername);
                            },
                            decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context).lbl_enter_email,
                              hintText:
                                  AppLocalizations.of(context).hnt_enter_eamil,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            focusNode: _fUsername,
                            controller: _fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre nom et prenom';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(_fPassword);
                            },
                            decoration: InputDecoration(
                              labelText: "Votre Nom et Prenom",
                              hintText: "Votre Nom et Prenom",
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _fPassword,
                          controller: _passwordController,
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
                          obscureText: !_showPassword,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, left: 15),
                          child: CustomDropDownWidget(this.genders, (value) {
                            this._selectedGender = value;
                          }),
                        ),
                      ),
                      // Container(
                      //   child: Container(
                      //     height: 150,
                      //     child: ListView(
                      //       children: numbers.keys.map((String key) {
                      //         return new CheckboxListTile(
                      //           title: new Text(
                      //             key,
                      //             style: TextStyle(color: Colors.black),
                      //           ),
                      //           value: numbers[key],
                      //           activeColor: Theme.of(context).primaryColor,
                      //           checkColor: Colors.white,
                      //           onChanged: (bool value) {
                      //             setState(() {
                      //               numbers[key] = value;
                      //             });
                      //           },
                      //         );
                      //       }).toList(),
                      //     ),
                      //   ),
                      // ),
                      Obx(
                        () => Container(
                          // color: Colors.red,
                          height: 45,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              var response = await apiController.signUpUser(
                                _fullNameController.text,
                                _emailController.text,
                                _selectedGender.toLowerCase(),
                                role,
                                _phoneController.text,
                                _passwordController.text,
                              );

                              if (response.status == false) {
                                MotionToast(
                                  icon: Icons.warning,
                                  primaryColor: Colors.red,
                                  title: Text("Error de connection"),
                                  description:
                                      Text("Veuillez verifier les champs"),
                                  width: 300,
                                  height: 100,
                                ).show(context);
                                return;
                              }

                              MotionToast(
                                  icon: Icons.verified,
                                  primaryColor: Colors.green,
                                  title: Text("Inscription reussie"),
                                  description: Text("Veuillez Connecter"),
                                  width: 300,
                                  height: 100,
                                  onClose: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceSelectionScreen()),
                                    );
                                  }).show(context);
                            },
                            child: apiController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    AppLocalizations.of(context).btn_next,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .txt_already_have_account,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  InkWell(
                                    child: Text(
                                        AppLocalizations.of(context).txt_login,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText2),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropDownWidget extends StatefulWidget {
  final List<String> list;
  final Function(String) onValueChanged;

  CustomDropDownWidget(this.list, this.onValueChanged);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  String firstDropDownValue;

  @override
  initState() {
    firstDropDownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: firstDropDownValue,
      // Use the selected value from state
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: nativeTheme().primaryColor),
      underline: Container(
        height: 2,
        color: nativeTheme().primaryColor,
      ),
      onChanged: (String value) {
        // This is called when the user selects an item.
        setState(() {
          firstDropDownValue = value;
        });
        widget.onValueChanged(value);
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
