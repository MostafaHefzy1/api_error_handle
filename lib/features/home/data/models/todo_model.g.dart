// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoItem _$ToDoItemFromJson(Map<String, dynamic> json) => ToDoItem(
      sId: json['_id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ToDoItemToJson(ToDoItem instance) => <String, dynamic>{
      '_id': instance.sId,
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
    };
