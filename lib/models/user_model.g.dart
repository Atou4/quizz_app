// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      token: json['token'],
      fileType: $enumDecodeNullable(_$FileTypeEnumMap, json['fileType']),
      fileuRl: json['fileuRl'] as String?,
      filenameoriginalfilestorageid: json['filenameoriginalfilestorageid'],
      aspectRatio: (json['aspectRatio'] as num?)?.toDouble(),
      obtained: json['obtained'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'token': instance.token,
      'fileType': _$FileTypeEnumMap[instance.fileType],
      'fileuRl': instance.fileuRl,
      'filenameoriginalfilestorageid': instance.filenameoriginalfilestorageid,
      'aspectRatio': instance.aspectRatio,
      'obtained': instance.obtained,
    };

const _$FileTypeEnumMap = {
  FileType.image: 'image',
  FileType.video: 'video',
};
