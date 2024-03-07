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
  String? referralCode;
  String? bank;
  String? accountNumber;
  String? accountName;
  int? audioCount;
  String? earnings;
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
    this.accountName,
    this.accountNumber,
    this.bank,
    this.earnings,
    this.referralCode,
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
      referralCode: json['referralCode'],
      bank: json['bank'],
      accountName: json['accountName'],
      accountNumber: json['accountNumber'],
      planName: json['planName'],
      audioCount: json['audioCount'],
      earnings: json['earnings'],
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
      'bank': bank,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'referralCode': referralCode,
      'audioCount': audioCount,
      'earnings': earnings,
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
