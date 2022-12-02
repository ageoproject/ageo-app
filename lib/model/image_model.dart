import 'dart:convert';

class ImageModel{
  int id;
  String imageHash;
  String imageName;
  Map<String,dynamic> sensorData;

  ImageModel({required this.id,required this.imageHash,required this.imageName, required this.sensorData});

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map["id"],
      imageHash: map["imageHash"],
      imageName: map["imageName"],
      sensorData: json.decode(map["sensorData"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageHash": imageHash,
    "imageName": imageName,
    "sensorData": json.encode(sensorData),
  };
}