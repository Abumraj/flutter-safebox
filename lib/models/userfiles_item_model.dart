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
        id: json["id"],
        name: json["name"],
        path: json["path"],
        parentId: int.parse(json["parent_id"]),
        isFolder: int.parse(json["is_folder"]),
        mime: json["mime"],
        size: json["size"],
        isFavourite: json["is_favourite"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json['updated_at']),
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
