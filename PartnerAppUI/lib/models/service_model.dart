class ServiceModel {
  final String id;
  final String serviceName;
  final List<String> usersOfferingService;
  final String description;
  final int duration;
  final String imageLink;
  final int price;
  final String title;
  ServiceModel(
      {this.id,
      this.serviceName,
      this.usersOfferingService,
      this.description,
      this.duration,
      this.imageLink,
      this.price,
      this.title});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'] ?? '',
      serviceName: json['serviceName'],
      usersOfferingService: json['usersOfferingService'].cast<String>(),
      description: json['description'],
      duration: json['duration'],
      imageLink: json['imageLink'],
      price: json['price'],
      title: json['title'],
    );
  }
}

