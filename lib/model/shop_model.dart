class ShopModel {
  int? id;
  String? shopName;
  String? shopAddress;
  String? openingTime;
  List<Category>? category;

  ShopModel(
      {this.id,
      this.shopName,
      this.shopAddress,
      this.openingTime,
      this.category});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    openingTime = json['opening_time'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['shop_address'] = this.shopAddress;
    data['opening_time'] = this.openingTime;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  
}

class Category {
  int? id;
  String? categoryName;
  String? image;
  List<ProductName>? productName;

  Category({this.id, this.categoryName, this.image, this.productName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    image = json['image'];
    if (json['product_name'] != null) {
      productName = <ProductName>[];
      json['product_name'].forEach((v) {
        productName!.add(new ProductName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['image'] = this.image;
    if (this.productName != null) {
      data['product_name'] = this.productName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductName {
  int? id;
  String? name;
  String? image;
  String? code;

  ProductName({this.id, this.name, this.image, this.code});

  ProductName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['code'] = this.code;
    return data;
  }
}
