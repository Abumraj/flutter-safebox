class UserDetail {
  int? id;
  String? name;
  String? email;
  String? country;
  dynamic picture;
  String? phone;
  String? usedStorage;
  String? totalStorage;
  String? planName;
  String? sizeWhatsapp;
  String? sizePhoto;
  String? sizeVideo;
  String? sizeAudio;
  String? sizeDocument;
  int? audioCount;
  int? videoCount;
  int? photoCount;
  int? documentCount;
  int? whatsappCount;

  UserDetail({
    this.id,
    this.name,
    this.email,
    this.country,
    this.picture,
    this.phone,
    this.usedStorage,
    this.totalStorage,
    this.planName,
    this.audioCount,
    this.documentCount,
    this.photoCount,
    this.sizeAudio,
    this.sizeDocument,
    this.sizePhoto,
    this.sizeVideo,
    this.sizeWhatsapp,
    this.videoCount,
    this.whatsappCount,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      country: json['country'],
      picture: json['picture'],
      phone: json['phone'],
      usedStorage: json['usedStorage'],
      totalStorage: json['totalStorage'],
      planName: json['planName'],
      audioCount: json['audioCount'],
      documentCount: json['documentCount'],
      photoCount: json['photoCount'],
      sizeAudio: json['sizeAudio'],
      sizeDocument: json['sizeDocument'],
      sizePhoto: json['sizePhoto'],
      sizeVideo: json['sizeVideo'],
      sizeWhatsapp: json['sizeWhatsapp'],
      videoCount: json['videoCount'],
      whatsappCount: json['whatsappCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'country': country,
      'picture': picture,
      'phone': phone,
      'usedStorage': usedStorage,
      'totalStorage': totalStorage,
      'planName': planName,
      'audioCount': audioCount,
      'documentCount': documentCount,
      'photoCount': photoCount,
      'sizeAudio': sizeAudio,
      'sizeDocument': sizeDocument,
      'sizePhoto': sizePhoto,
      'sizeVideo': sizeVideo,
      'sizeWhatsapp': sizeWhatsapp,
      'videoCount': videoCount,
      'whatsappCount': whatsappCount,
    };
  }
}
