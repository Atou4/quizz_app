// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String? get question => throw _privateConstructorUsedError;
  String? get correctanswer => throw _privateConstructorUsedError;
  List<String?>? get incorrrectanswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res>;
  $Res call(
      {String? question,
      String? correctanswer,
      List<String?>? incorrrectanswer});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  final QuestionModel _value;
  // ignore: unused_field
  final $Res Function(QuestionModel) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? correctanswer = freezed,
    Object? incorrrectanswer = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correctanswer: correctanswer == freezed
          ? _value.correctanswer
          : correctanswer // ignore: cast_nullable_to_non_nullable
              as String?,
      incorrrectanswer: incorrrectanswer == freezed
          ? _value.incorrrectanswer
          : incorrrectanswer // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$_QuestionModelCopyWith(
          _$_QuestionModel value, $Res Function(_$_QuestionModel) then) =
      __$$_QuestionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? question,
      String? correctanswer,
      List<String?>? incorrrectanswer});
}

/// @nodoc
class __$$_QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res>
    implements _$$_QuestionModelCopyWith<$Res> {
  __$$_QuestionModelCopyWithImpl(
      _$_QuestionModel _value, $Res Function(_$_QuestionModel) _then)
      : super(_value, (v) => _then(v as _$_QuestionModel));

  @override
  _$_QuestionModel get _value => super._value as _$_QuestionModel;

  @override
  $Res call({
    Object? question = freezed,
    Object? correctanswer = freezed,
    Object? incorrrectanswer = freezed,
  }) {
    return _then(_$_QuestionModel(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      correctanswer: correctanswer == freezed
          ? _value.correctanswer
          : correctanswer // ignore: cast_nullable_to_non_nullable
              as String?,
      incorrrectanswer: incorrrectanswer == freezed
          ? _value._incorrrectanswer
          : incorrrectanswer // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel extends _QuestionModel with DiagnosticableTreeMixin {
  const _$_QuestionModel(
      {required this.question,
      required this.correctanswer,
      required final List<String?>? incorrrectanswer})
      : _incorrrectanswer = incorrrectanswer,
        super._();

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionModelFromJson(json);

  @override
  final String? question;
  @override
  final String? correctanswer;
  final List<String?>? _incorrrectanswer;
  @override
  List<String?>? get incorrrectanswer {
    final value = _incorrrectanswer;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionModel(question: $question, correctanswer: $correctanswer, incorrrectanswer: $incorrrectanswer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionModel'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('correctanswer', correctanswer))
      ..add(DiagnosticsProperty('incorrrectanswer', incorrrectanswer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionModel &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality()
                .equals(other.correctanswer, correctanswer) &&
            const DeepCollectionEquality()
                .equals(other._incorrrectanswer, _incorrrectanswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(correctanswer),
      const DeepCollectionEquality().hash(_incorrrectanswer));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      __$$_QuestionModelCopyWithImpl<_$_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionModelToJson(
      this,
    );
  }
}

abstract class _QuestionModel extends QuestionModel {
  const factory _QuestionModel(
      {required final String? question,
      required final String? correctanswer,
      required final List<String?>? incorrrectanswer}) = _$_QuestionModel;
  const _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  String? get question;
  @override
  String? get correctanswer;
  @override
  List<String?>? get incorrrectanswer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
