class ProductsModule {
 final String id;
 final String imgUrl;
 final String name;
 final int category_id;

 ProductsModule({required this.id, required this.imgUrl, required this.name, required this.category_id});

 factory ProductsModule.fromJson(Map<String,dynamic> json){
   return ProductsModule(
    id :json['id'],
    imgUrl :json['image_url'],
    name : json['name'],
   category_id: json['category_id']
 );
 }

  Map<String, dynamic> toJson()=> {
    'id' : id,
    'image_url' :imgUrl,
    'name' : name,
    "category_id":category_id.toString()
  };
}