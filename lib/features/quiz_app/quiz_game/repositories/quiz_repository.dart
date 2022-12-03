

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/firebase/firebase_firestore_extension.dart';
import 'package:quizz_app/features/quiz_app/quiz_game/models/quiz_model.dart';

import '../../../../providers/general_providers.dart';
import '../models/question_model.dart';
import '../../../../exceptions/custom_exception.dart';



abstract class QuizBaseRepository {
  Future<List<QuizModel>> retrieveQuizes({required String category});
  Future<void> updateQuiz({required String quizid, required QuizModel quiz});
  Future<void> updateQuizQuestion({required String quizid, required QuestionModel quiz});
  Future<String> createQuiz({required QuizModel quiz});
  Future<void> deleteQuiz({required String quizid});
  Future<void> retrieveAllQuizes();
}

final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref));

class QuizRepository implements QuizBaseRepository {
  final Ref ref;

  const QuizRepository(this.ref);

  @override
  Future<String> createQuiz({
    required QuizModel quiz,
  }) async {
    try {
      final docRef = await ref.read(firebaseFirestoreProvider)
          .quizListRef()
          .add(quiz.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<QuizModel>> retrieveQuizes({required String category}) async {
    try {
      final snap =
          await ref.read(firebaseFirestoreProvider).quizListRef().where("category",isEqualTo: category).get();
      return snap.docs.map((doc) => QuizModel.fromDocument(doc)).toList(); 
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<QuizModel>> retrieveAllQuizes() async {
    try {
      final snap =
          await ref.read(firebaseFirestoreProvider).quizListRef().get();;
      return snap.docs.map((doc) => QuizModel.fromDocument(doc)).toList(); 
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateQuiz({required String quizid, required QuizModel quiz}) async {
    try {
     await ref.read(firebaseFirestoreProvider)
          .quizListRef()
          .doc(quizid)
          .update(quiz.toDocument());

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
    
  }

  @override
  Future<void> updateQuizQuestion({required String quizid, required QuestionModel quiz}) async {
    try {
     await ref.read(firebaseFirestoreProvider)
          .quizListRef()
          .doc(quizid)
          .update({'question':FieldValue.arrayUnion([quiz.toDocument()])},);;

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
    
  }

  @override
  Future<void> deleteQuiz({
    required String quizid,
  }) async {
    try {
      await ref.read(firebaseFirestoreProvider)
          .quizListRef()
          .doc(quizid)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

    
}