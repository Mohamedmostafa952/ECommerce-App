/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

class Category {
  Category({
      required this.id, 
      required this.name, 
      required this.slug, 
      required this.image, 
      required this.createdAt, 
      required this.updatedAt,});

  factory Category.fromJson(dynamic json) {
    return Category(id: json['_id'], name: json['name'], slug: json['slug'], image: json['image'], createdAt: json['createdAt'], updatedAt: json['updatedAt']);

  }
  String id;
  String name;
  String slug;
  String image;
  String createdAt;
  String updatedAt;



}