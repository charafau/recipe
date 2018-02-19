// GENERATED CODE - DO NOT MODIFY BY HAND

part of result;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<Result> _$resultSerializer = new _$ResultSerializer();

class _$ResultSerializer implements StructuredSerializer<Result> {
  @override
  final Iterable<Type> types = const [Result, _$Result];
  @override
  final String wireName = 'Result';

  @override
  Iterable serialize(Serializers serializers, Result object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(double)),
      'href',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Recipe)])),
    ];

    return result;
  }

  @override
  Result deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'href':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Recipe)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Result extends Result {
  @override
  final String title;
  @override
  final double version;
  @override
  final String link;
  @override
  final BuiltList<Recipe> results;

  factory _$Result([void updates(ResultBuilder b)]) =>
      (new ResultBuilder()..update(updates)).build();

  _$Result._({this.title, this.version, this.link, this.results}) : super._() {
    if (title == null) throw new BuiltValueNullFieldError('Result', 'title');
    if (version == null)
      throw new BuiltValueNullFieldError('Result', 'version');
    if (link == null) throw new BuiltValueNullFieldError('Result', 'link');
    if (results == null)
      throw new BuiltValueNullFieldError('Result', 'results');
  }

  @override
  Result rebuild(void updates(ResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultBuilder toBuilder() => new ResultBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    return title == other.title &&
        version == other.version &&
        link == other.link &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), version.hashCode), link.hashCode),
        results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Result')
          ..add('title', title)
          ..add('version', version)
          ..add('link', link)
          ..add('results', results))
        .toString();
  }
}

class ResultBuilder implements Builder<Result, ResultBuilder> {
  _$Result _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  double _version;
  double get version => _$this._version;
  set version(double version) => _$this._version = version;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  ListBuilder<Recipe> _results;
  ListBuilder<Recipe> get results =>
      _$this._results ??= new ListBuilder<Recipe>();
  set results(ListBuilder<Recipe> results) => _$this._results = results;

  ResultBuilder();

  ResultBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _version = _$v.version;
      _link = _$v.link;
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Result other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Result;
  }

  @override
  void update(void updates(ResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Result build() {
    _$Result _$result;
    try {
      _$result = _$v ??
          new _$Result._(
              title: title,
              version: version,
              link: link,
              results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Result', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
