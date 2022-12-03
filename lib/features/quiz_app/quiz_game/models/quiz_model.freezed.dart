// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return _QuizModel.fromJson(json);
}

/// @nodoc
mixin _$QuizModel {
  String? get id => throw _privateConstructorUsedError;
  String? get quizname => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get difficulty => throw _privateConstructorUsedError;
  List<QuestionModel?> get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizModelCopyWith<QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizModelCopyWith<$Res> {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) then) =
      _$QuizModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? quizname,
      String? category,
      int? difficulty,
      List<QuestionModel?> question});
}

/// @nodoc
class _$QuizModelCopyWithImpl<$Res> implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._value, this._then);

  final QuizModel _value;
  // ignore: unused_field
  final $Res Function(QuizModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? quizname = freezed,
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizname: quizname == freezed
          ? _value.quizname
          : quizname // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel?>,
    ));
  }
}

/// @nodoc
abstract class _$$_QuizModelCopyWith<$Res> implements $QuizModelCopyWith<$Res> {
  factory _$$_QuizModelCopyWith(
          _$_QuizModel value, $Res Function(_$_QuizModel) then) =
      __$$_QuizModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? quizname,
      String? category,
      int? difficulty,
      List<QuestionModel?> question});
}

/// @nodoc
class __$$_QuizModelCopyWithImpl<$Res> extends _$QuizModelCopyWithImpl<$Res>
    implements _$$_QuizModelCopyWith<$Res> {
  __$$_QuizModelCopyWithImpl(
      _$_QuizModel _value, $Res Function(_$_QuizModel) _then)
      : super(_value, (v) => _then(v as _$_QuizModel));

  @override
  _$_QuizModel get _value => super._value as _$_QuizModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? quizname = freezed,
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? question = freezed,
  }) {
    return _then(_$_QuizModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizname: quizname == freezed
          ? _value.quizname
          : quizname // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      question: question == freezed
          ? _value._question
          : question // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizModel extends _QuizModel with DiagnosticableTreeMixin {
  const _$_QuizModel(
      {this.id,
      required this.quizname,
      required this.category,
      required this.difficulty,
      final List<QuestionModel?> question = const []})
      : _question = question,
        super._();

  factory _$_QuizModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuizModelFromJson(json);

  @override
  final String? id;
  @override
  final String? quizname;
  @override
  final String? category;
  @override
  final int? difficulty;
  final List<QuestionModel?> _question;
  @override
  @JsonKey()
  List<QuestionModel?> get question {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_question);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizModel(id: $id, quizname: $quizname, category: $category, difficulty: $difficulty, question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('quizname', quizname))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.quizname, quizname) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other._question, _question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(quizname),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(_question));

  @JsonKey(ignore: true)
  @override
  _$$_QuizModelCopyWith<_$_QuizModel> get copyWith =>
      __$$_QuizModelCopyWithImpl<_$_QuizModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizModelToJson(
      this,
    );
  }
}

abstract class _QuizModel extends QuizModel {
  const factory _QuizModel(
      {final String? id,
      required final String? quizname,
      required final String? category,
      required final int? difficulty,
      final List<QuestionModel?> question}) = _$_QuizModel;
  const _QuizModel._() : super._();

  factory _QuizModel.fromJson(Map<String, dynamic> json) =
      _$_QuizModel.fromJson;

  @override
  String? get id;
  @override
  String? get quizname;
  @override
  String? get category;
  @override
  int? get difficulty;
  @override
  List<QuestionModel?> get question;
  @override
  @JsonKey(ignore: true)
  _$$_QuizModelCopyWith<_$_QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}
