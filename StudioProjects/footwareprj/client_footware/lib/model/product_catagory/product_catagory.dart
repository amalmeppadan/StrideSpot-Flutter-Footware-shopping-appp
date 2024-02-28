import 'package:json_annotation/json_annotation.dart';
part 'product_catagory.g.dart';

@JsonSerializable()
class ProductCatagory {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  ProductCatagory({
    this.id,
    this.name,

  });

  factory ProductCatagory.fromJson(Map<String, dynamic> json) => _$ProductCatagoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCatagoryToJson(this);
}