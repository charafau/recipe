// GENERATED CODE - DO NOT MODIFY BY HAND

part of recipe;

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

Serializer<Recipe> _$recipeSerializer = new _$RecipeSerializer();

class _$RecipeSerializer implements StructuredSerializer<Recipe> {
  @override
  final Iterable<Type> types = const [Recipe, _$Recipe];
  @override
  final String wireName = 'Recipe';

  @override
  Iterable serialize(Serializers serializers, Recipe object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'href',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'ingredients',
      serializers.serialize(object.ingredients,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Recipe deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new RecipeBuilder();

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
        case 'href':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ingredients':
          result.ingredients = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Recipe extends Recipe {
  @override
  final String title;
  @override
  final String link;
  @override
  final String ingredients;
  @override
  final String thumbnail;

  factory _$Recipe([void updates(RecipeBuilder b)]) =>
      (new RecipeBuilder()..update(updates)).build();

  _$Recipe._({this.title, this.link, this.ingredients, this.thumbnail})
      : super._() {
    if (title == null) throw new BuiltValueNullFieldError('Recipe', 'title');
    if (link == null) throw new BuiltValueNullFieldError('Recipe', 'link');
    if (ingredients == null)
      throw new BuiltValueNullFieldError('Recipe', 'ingredients');
    if (thumbnail == null)
      throw new BuiltValueNullFieldError('Recipe', 'thumbnail');
  }

  @override
  Recipe rebuild(void updates(RecipeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeBuilder toBuilder() => new RecipeBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Recipe) return false;
    return title == other.title &&
        link == other.link &&
        ingredients == other.ingredients &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), link.hashCode), ingredients.hashCode),
        thumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Recipe')
          ..add('title', title)
          ..add('link', link)
          ..add('ingredients', ingredients)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class RecipeBuilder implements Builder<Recipe, RecipeBuilder> {
  _$Recipe _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  String _ingredients;
  String get ingredients => _$this._ingredients;
  set ingredients(String ingredients) => _$this._ingredients = ingredients;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  RecipeBuilder();

  RecipeBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _link = _$v.link;
      _ingredients = _$v.ingredients;
      _thumbnail = _$v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Recipe other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Recipe;
  }

  @override
  void update(void updates(RecipeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Recipe build() {
    final _$result = _$v ??
        new _$Recipe._(
            title: title,
            link: link,
            ingredients: ingredients,
            thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}
