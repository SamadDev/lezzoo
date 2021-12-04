class CategoryModule {
  final String id;
  final String name;
  final String store_id;

  CategoryModule({required this.id, required this.name,required this.store_id});

  factory CategoryModule.fromJson(Map<String, dynamic> json)=>CategoryModule(
     store_id: json['store_id'],
      id :json['id'],
      name: json['name']
  );


}