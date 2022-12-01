import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/firebase/firebase_firestore_extension.dart';
import 'package:quizz_app/general_providers.dart';
import 'package:quizz_app/models/quiz_model.dart';
import 'package:quizz_app/views/admin/add_quiz/add_quiz._screen.dart';
import 'package:quizz_app/views/client/home/components/quizes/quiz_list.dart';

import '../../models/question_model.dart';
import '../../repositories/exceptions/custom_exception.dart';
import '../../repositories/quiz_repository.dart';

enum quizListFilter {
  all,
  obtained,
}

final quizListFilterProvider =
    StateProvider<quizListFilter>((_) => quizListFilter.all);

final filteredquizListProvider = Provider<List<QuizModel>>((ref) {
  final quizListFilterState = ref.watch(quizListFilterProvider.notifier).state;
  final quizListState = ref.watch(quizListControllerProvider);
  return quizListState.maybeWhen(
    data: (items) {
      switch (quizListFilterState) {
        case quizListFilter.obtained:
          return items.where((item) => true).toList();
        default:
          return items;
      }
    },
    orElse: () => [],
  );
});

final quizListExceptionProvider = StateProvider<CustomException?>((_) => null);



final quizListControllerProvider =
    StateNotifierProvider<quizListController, AsyncValue<List<QuizModel>>>(
  (ref) {
    return quizListController(ref);
  },
);

class quizListController extends StateNotifier<AsyncValue<List<QuizModel>>> {
  final Ref ref;

  quizListController(
    this.ref,
  ) : super(AsyncValue.data([QuizModel.empty()])) {
     retrieveallquizes();
  }

  Future<List<QuizModel>?> retrieveQuizes({required String categoryname}) async {
    try {
      final items = await ref
          .read(quizRepositoryProvider)
          .retrieveQuizes(category: categoryname);
      if (mounted) {
        state = AsyncValue.data(items);
      }
      return items;
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
    return null;
  }
    Future<void> retrieveallquizes() async {
    
    try {
      final quizes= await ref
            .read(quizRepositoryProvider).retrieveAllQuizes();
        if (mounted) {
         state = AsyncValue.data(quizes);
        }
      state = AsyncValue.data(quizes);
      
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  } 

  Future<void> createQuiz(
      {required QuizModel quiz, bool obtained = false}) async {
    try {
      final itemId =
          await ref.read(quizRepositoryProvider).createQuiz(quiz: quiz);
      await ref.read(quizRepositoryProvider).updateQuiz(
          quizid: itemId,
          quiz: QuizModel(
              id: itemId,
              quizname: quiz.quizname,
              category: quiz.category,
              difficulty: quiz.difficulty));
      ref.read(quizid.notifier).state = itemId;
      state.whenData((items) =>
          state = AsyncValue.data(items..add(quiz.copyWith(id: itemId))));
    } on CustomException catch (e) {
      ref.read(quizListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateQuiz({required QuizModel quiz}) async {
    try {
      state = AsyncValue.loading();
      await ref
          .read(quizRepositoryProvider)
          .updateQuiz(quizid: quiz.id.toString(), quiz: quiz);
    } on CustomException catch (e) {
      ref.read(quizListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateQuizQuestion(
      {required String quizid, required QuestionModel quiz}) async {
    try {
      state = AsyncValue.loading();
      await ref
          .read(quizRepositoryProvider)
          .updateQuizQuestion(quizid: quizid, quiz: quiz);
    } on CustomException catch (e) {
      ref.read(quizListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> deleteItem({required String quizId}) async {
    try {
      await ref.read(quizRepositoryProvider).deleteQuiz(quizid: quizId);
      state.whenData((quizes) => state =
          AsyncValue.data(quizes..removeWhere((quiz) => quiz.id == quizId)));
    } on CustomException catch (e) {
      ref.read(quizListExceptionProvider.notifier).state = e;
    }
  }
}
