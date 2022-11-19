// ignore_for_file: unnecessary_new

class ProductModel {
  int? id;
  String? name;
  String? price;
  String? image;
  String? code;

  ProductModel({this.id, this.name, this.image, this.code, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    code = json['code'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['code'] = code;
    data['price'] = price;

    return data;
  }
}
