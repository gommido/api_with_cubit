class Products
{
  int? id;
  String? title;
  int? price;
  String? brand;
  String? category;
  int? stock;



  Products({

    this.id,
    this.title,
    this.price,
    this.brand,
    this.category,


  });



  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      brand: json["brand"],
      category: json["category"],


    );
  }

}