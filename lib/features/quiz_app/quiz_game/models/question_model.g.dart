// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      question: json['question'] as String?,
      correctanswer: json['correctanswer'] as String?,
      incorrrectanswer: (json['incorrrectanswer'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correctanswer': instance.correctanswer,
      'incorrrectanswer': instance.incorrrectanswer,
    };
