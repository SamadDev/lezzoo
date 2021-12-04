class StoresModule {
  final String id;
  final String storeType;
  final String imgUrl;
  final String name;
  final location;


  StoresModule(
      {required this.id,
      required this.storeType,
      required this.imgUrl,
      required this.name,
       required this.location
      });

  factory StoresModule.fromJson(Map<String, dynamic> json) => StoresModule(
        id: json['id'],
        storeType: json['type'],
        imgUrl: json['image_url'],
        name: json['name'],
      location: json['location']
      );
}
