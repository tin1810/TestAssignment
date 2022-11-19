class JewelleryModel {
  int? id;
  String? name;
  String? image;
  String? code;

  JewelleryModel({this.id, this.name, this.image, this.code});

  JewelleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['code'] = code;
    return data;
  }
}
