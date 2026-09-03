class SmsMessageModel {
  final String? address;
  final String? body;
  final int? date;

  SmsMessageModel({this.address, this.body, this.date});

  // Factory constructor to create an instance from a JSON map
  factory SmsMessageModel.fromJson(Map<String, dynamic> json) {
    return SmsMessageModel(
      address: json['address'],
      body: json['body'],
      date: json['date'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'body': body,
      'date': date,
    };
  }
}
