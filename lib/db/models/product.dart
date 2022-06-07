class Product {
  int ?id;
  String ?name;
  int ?price;
  int ?weight;

  Product({
     this.id,
     this.name,
     this.price,
     this.weight,
  });

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};

    data['id'] = id;
    data['name'] = name ;
    data['price'] = price ;
    data['weight'] = weight;

    return data;
  }
}