import 'package:get/get.dart';

class FileoptionsItemModel {
  int id;
  String productName;
  bool checkmarkImage ;

  FileoptionsItemModel(
      {required this.id, required this.productName, this.checkmarkImage = false});

  factory FileoptionsItemModel.fromJson(Map<String, dynamic> json) =>
      FileoptionsItemModel(
        id: json["id"],
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
      };
}
