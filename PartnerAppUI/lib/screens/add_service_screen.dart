import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pet_patner_demo/controllers/ApiController.dart';
import 'package:pet_patner_demo/screens/offer_service_screen.dart';
import 'package:pet_patner_demo/widgets/bottomnavigationbar.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final ApiController apiController = Get.put(ApiController());
  final _formKey = GlobalKey<FormState>();
  String serviceName = '';
  String imageLink = '';
  String title = '';
  int price = 0;
  int duration = 0;
  String description = '';
  Duration selectedDuration = Duration();
  var _fServiceNom = new FocusNode();
  var _fImageLink = new FocusNode();
  var _fTitle = new FocusNode();
  var _fPrice = new FocusNode();
  var _fDescription = new FocusNode();

  void _openDurationPicker() async {
    final pickedDuration = await showDurationPicker(
        context: context,
        initialTime: selectedDuration,
        baseUnit: BaseUnit.hour);

    if (pickedDuration != null && pickedDuration != selectedDuration) {
      setState(() {
        selectedDuration = pickedDuration;
        duration = selectedDuration.inHours;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _fServiceNom,
                decoration: InputDecoration(
                  labelText: 'Nom de service',
                  prefixIcon: Icon(Icons.work),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir un nom de service';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    serviceName = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _fImageLink,
                decoration: InputDecoration(
                  labelText: 'Lien d\'image',
                  prefixIcon: Icon(Icons.image),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer un lien d\'image';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    imageLink = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _fTitle,
                decoration: InputDecoration(
                  labelText: 'Titre',
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir un titre';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _fPrice,
                decoration: InputDecoration(
                  labelText: 'Prix',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer un prix';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Veuillez entrer un prix valide';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    price = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _fDescription,
                decoration: InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir une description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Durée par jour'),
                subtitle: Text(selectedDuration.toString().split('.').first),
                trailing: ElevatedButton(
                  onPressed: _openDurationPicker,
                  child: Text('Sélectionnez la durée'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3646C3),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState.validate()) {
                    if (duration == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Veuillez sélectionner une durée'),
                        ),
                      );
                      return;
                    } else {
                      var response = await apiController.addService(
                        "testuser@gmail.com",
                        serviceName,
                        imageLink,
                        title,
                        price,
                        description,
                        duration,
                      );
                      if (response.status == false) {
                        MotionToast(
                          icon: Icons.warning,
                          primaryColor: Colors.red,
                          title: Text("Error de connection"),
                          description: Text(""),
                          width: 300,
                          height: 100,
                        ).show(context);
                        return;
                      }

                      MotionToast(
                          icon: Icons.verified,
                          primaryColor: Colors.green,
                          title: Text("Création reussie"),
                          description: Text("Veuillez Connecter"),
                          width: 300,
                          height: 100,
                          onClose: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bottomnavigationbar(),
                              ),
                            );
                          }).show(context);
                    }
                  }
                },
                child: Obx(() => !apiController.isLoadingAddService.value
                    ? const Center(child: CircularProgressIndicator())
                    : Text('Enregistrer')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
