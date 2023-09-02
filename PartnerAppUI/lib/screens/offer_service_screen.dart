import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_patner_demo/controllers/ApiController.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/add_service_screen.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/widgets/pet_item.dart';

class OfferServiceScreen extends BaseRoute {
  OfferServiceScreen({a, o}) : super(a: a, o: o, r: 'OfferServiceScreen');
  @override
  _OfferServiceScreenState createState() => _OfferServiceScreenState();
}

class _OfferServiceScreenState extends BaseRouteState {
  final ApiController apiController = Get.find<ApiController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await apiController.fetchServices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_services,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.bell),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Align(
                alignment: Alignment.topRight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0, color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ServiceAgreementScreen(),
                    //   ),
                    // );
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddServiceScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).btn_offer_services_now,
                    style: Theme.of(context).primaryTextTheme.bodyText2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              !apiController.isLoadingServices.value
                  ? ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: PetItem(
                            service: apiController.servicesList[index],
                          ),
                        );
                      }),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: apiController.servicesList.length,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ]),
          ),
        ),
      ),
    );
  }
}
