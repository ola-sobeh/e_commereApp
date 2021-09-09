class Product {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  Product.fromJson(dynamic json) {
        this.id =json['id'] ;
        this.title =  json['title'] ;
        this.price = json['price'] ;
        this.description= json['description'];
        this.category = json['category'] ;
        this.image = json['image'] ;
  }
}