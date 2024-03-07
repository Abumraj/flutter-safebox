class ReeferredUserModel {
  final int id;
  final String? name;
  final String? picture;
  final int credit; // Uncomment if needed
  final String? status;
  final DateTime? updatedAt;

  ReeferredUserModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.credit, // Uncomment if needed
    required this.status,
    required this.updatedAt,
  });

  factory ReeferredUserModel.fromJson(Map<String, dynamic> json) {
    return ReeferredUserModel(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      credit: json['credit'], // Uncomment if needed
      status: json['status'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'credit': credit, // Uncomment if needed
      'status': status,
      'updatedAt': updatedAt!.toIso8601String(),
    };
  }
}
