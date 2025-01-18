import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';

@JsonSerializable()
class ToDoItem {
  @JsonKey(name: "_id")
  String? sId;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? createdAt;
  ToDoItem({
    this.sId,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.createdAt
  });
  factory ToDoItem.fromJson(Map<String, dynamic> json) =>
      _$ToDoItemFromJson(json);

  // ToDoItem.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   image = json['image'];
  //   title = json['title'];
  //   desc = json['desc'];
  //   priority = json['priority'];
  //   status = json['status'];
  //   user = json['user'];
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['image'] = this.image;
  //   data['title'] = this.title;
  //   data['desc'] = this.desc;
  //   data['priority'] = this.priority;
  //   data['status'] = this.status;
  //   data['user'] = this.user;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}
