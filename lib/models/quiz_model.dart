import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:quizz_app/models/question_model.dart';

part 'quiz_model.g.dart';
part 'quiz_model.freezed.dart';

@freezed
abstract class QuizModel implements _$QuizModel {
  const QuizModel._();

  const factory QuizModel({
    String? id,
   required String?  quizname,
   required String? category,
   required int? difficulty,
   @Default([]) List<QuestionModel?> question,

  }) = _QuizModel;

  factory QuizModel.empty() => QuizModel(quizname: '',  category: '', difficulty: null, question: []);

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);

  factory QuizModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!as Map<String, dynamic>;
    return QuizModel.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson();
}