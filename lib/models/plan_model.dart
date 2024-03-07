class Plan {
  final int id;
  final String planName;
  final int planPrice;
  final String planStorage;
  final bool referral;
  final String planCode;

  Plan({
    required this.id,
    required this.planName,
    required this.planPrice,
    required this.planStorage,
    required this.referral,
    required this.planCode,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      planName: json['planName'],
      planPrice: int.parse(json['planPrice']),
      planStorage: json['planStorage'],
      referral: json['referral'] == 'yes',
      planCode: json['planCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planName': planName,
      'planPrice': planPrice,
      'planStorage': planStorage,
      'referral': referral ? 'yes' : 'no',
      'planCode': planCode,
    };
  }
}
