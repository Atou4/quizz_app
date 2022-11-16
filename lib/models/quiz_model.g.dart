// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizModel _$$_QuizModelFromJson(Map<String, dynamic> json) => _$_QuizModel(
      id: json['id'] as String?,
      quizname: json['quizname'] as String?,
      category: json['category'] as String?,
      difficulty: json['difficulty'] as int?,
      question: (json['question'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : QuestionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_QuizModelToJson(_$_QuizModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quizname': instance.quizname,
      'category': instance.category,
      'difficulty': instance.difficulty,
      'question': instance.question,
    };
