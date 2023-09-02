import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/service_model.dart';
import 'package:pet_patner_demo/widgets/attribut_item.dart';

class PetItem extends StatelessWidget {
  final ServiceModel service;
  const PetItem({Key key, @required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      margin: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        service.imageLink ?? "assets/images/userImage.png",
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 3,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Image.asset("assets/images/splash_logo.png"),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          service.serviceName ?? "",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        attributItem(
                          Icons.hourglass_bottom_rounded,
                          service.duration.toString() ?? "",
                          Colors.green,
                        ),
                        attributItem(
                          Icons.attach_money_rounded,
                          "${service.price.toString()} TND" ?? "",
                          Colors.red,
                        ),
                         Text(
                           service.description ?? "",
                           style: TextStyle(
                             fontWeight: FontWeight.normal,
                             color: Colors.grey,
                             fontSize: 12
                           ),
                           overflow: TextOverflow.ellipsis,
                           maxLines: 3,
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
