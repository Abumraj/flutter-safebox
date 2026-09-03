class UserfilesItemModel {
  int? id;
  String? name;
  String? path;
  int? parentId;
  int? isFolder;
  dynamic mime;
  String? size;
  bool? isFavourite;
  String? createdAt;
  DateTime? updatedAt;

  UserfilesItemModel({
    this.id,
    this.name,
    this.path,
    this.parentId,
    this.isFolder,
    this.mime,
    this.size,
    this.isFavourite,
    this.createdAt,
    this.updatedAt,
  });

  factory UserfilesItemModel.fromJson(Map<String, dynamic> json) =>
      UserfilesItemModel(
        id: json["id"] is int ? json["id"] : int.tryParse(json["id"] ?? ''),
        name: json["name"],
        path: json["path"],
        parentId: json["parent_id"] is int
            ? json["parent_id"]
            : int.tryParse(json["parent_id"] ?? ''),
        isFolder: json["is_folder"] is int
            ? json["is_folder"]
            : int.tryParse(json["is_folder"] ?? ''),
        mime: json["mime"],
        size: json["size"],
        isFavourite: json["is_favourite"],
        createdAt: json["created_at"],
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "parent_id": parentId,
        "is_folder": isFolder,
        "mime": mime,
        "size": size,
        "is_favourite": isFavourite,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
