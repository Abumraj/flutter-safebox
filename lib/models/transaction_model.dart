class TransactionModel {
  final int id;
  final String type;
  final int amount; // Uncomment if needed
  final String status;
  final DateTime? updatedAt;

  TransactionModel(
      {required this.id,
      required this.type,
      required this.amount,
      required this.status,
      required this.updatedAt});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: json['type'],
      amount: int.parse(json['amount']), // Uncomment if needed
      status: json['status'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'amount': amount, // Uncomment if needed
      'status': status,
      'updatedAt': updatedAt!.toIso8601String(),
    };
  }
}
