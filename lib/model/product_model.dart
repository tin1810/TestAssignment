class ProductModel {
  int? id;
  String? name;
  String? image;
  int? price;
  String? code;

  ProductModel({this.id, this.name, this.image, this.price, this.code});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['code'] = this.code;
    return data;
  }
}
