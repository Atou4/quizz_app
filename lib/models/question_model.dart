
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'question_model.g.dart';
part 'question_model.freezed.dart';

@freezed
abstract class QuestionModel implements _$QuestionModel {
  const QuestionModel._();

  const factory QuestionModel({
  required String? question,
  required String? correctanswer,
  required List<String?>? incorrrectanswer,



  }) = _QuestionModel;

  factory QuestionModel.empty() => QuestionModel(question: '',  correctanswer: '', incorrrectanswer: []);

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  factory QuestionModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!as Map<String, dynamic>;
    return QuestionModel.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson();
}
