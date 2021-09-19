class AllProductsResponse {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;


  AllProductsResponse(int i, String s, num p, String ss, String sss, String s3,
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,});

  AllProductsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  AllProductsResponse.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.price = map['price'];
    this.description = map['description'];
    this.category = map['category'];
    this.image = map['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;

    return data;
  }

  toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'price': this.price,
      'description': this.description,
      'category': this.category,
      'image': this.image,
    };
  }
}
