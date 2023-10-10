// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserCartTable extends UserCart
    with TableInfo<$UserCartTable, UserCartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $UserCartTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemSizeMeta =
      const VerificationMeta('itemSize');
  @override
  late final GeneratedColumn<String> itemSize = GeneratedColumn<String>(
      'item_size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemPriceMeta =
      const VerificationMeta('itemPrice');
  @override
  late final GeneratedColumn<String> itemPrice = GeneratedColumn<String>(
      'item_price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemColorMeta =
      const VerificationMeta('itemColor');
  @override
  late final GeneratedColumn<String> itemColor = GeneratedColumn<String>(
      'item_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemCountMeta =
      const VerificationMeta('itemCount');
  @override
  late final GeneratedColumn<int> itemCount = GeneratedColumn<int>(
      'item_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, title, imageUrl, itemSize, itemPrice, itemColor, itemCount];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'user_cart';

  @override
  VerificationContext validateIntegrity(Insertable<UserCartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('item_size')) {
      context.handle(_itemSizeMeta,
          itemSize.isAcceptableOrUnknown(data['item_size']!, _itemSizeMeta));
    } else if (isInserting) {
      context.missing(_itemSizeMeta);
    }
    if (data.containsKey('item_price')) {
      context.handle(_itemPriceMeta,
          itemPrice.isAcceptableOrUnknown(data['item_price']!, _itemPriceMeta));
    } else if (isInserting) {
      context.missing(_itemPriceMeta);
    }
    if (data.containsKey('item_color')) {
      context.handle(_itemColorMeta,
          itemColor.isAcceptableOrUnknown(data['item_color']!, _itemColorMeta));
    } else if (isInserting) {
      context.missing(_itemColorMeta);
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count']!, _itemCountMeta));
    } else if (isInserting) {
      context.missing(_itemCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  UserCartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserCartData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      itemSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_size'])!,
      itemPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_price'])!,
      itemColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_color'])!,
      itemCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_count'])!,
    );
  }

  @override
  $UserCartTable createAlias(String alias) {
    return $UserCartTable(attachedDatabase, alias);
  }
}

class UserCartData extends DataClass implements Insertable<UserCartData> {
  final int id;
  final int itemId;
  final String title;
  final String imageUrl;
  final String itemSize;
  final String itemPrice;
  final String itemColor;
  final int itemCount;

  const UserCartData(
      {required this.id,
      required this.itemId,
      required this.title,
      required this.imageUrl,
      required this.itemSize,
      required this.itemPrice,
      required this.itemColor,
      required this.itemCount});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['title'] = Variable<String>(title);
    map['image_url'] = Variable<String>(imageUrl);
    map['item_size'] = Variable<String>(itemSize);
    map['item_price'] = Variable<String>(itemPrice);
    map['item_color'] = Variable<String>(itemColor);
    map['item_count'] = Variable<int>(itemCount);
    return map;
  }

  UserCartCompanion toCompanion(bool nullToAbsent) {
    return UserCartCompanion(
      id: Value(id),
      itemId: Value(itemId),
      title: Value(title),
      imageUrl: Value(imageUrl),
      itemSize: Value(itemSize),
      itemPrice: Value(itemPrice),
      itemColor: Value(itemColor),
      itemCount: Value(itemCount),
    );
  }

  factory UserCartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserCartData(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      title: serializer.fromJson<String>(json['title']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      itemSize: serializer.fromJson<String>(json['itemSize']),
      itemPrice: serializer.fromJson<String>(json['itemPrice']),
      itemColor: serializer.fromJson<String>(json['itemColor']),
      itemCount: serializer.fromJson<int>(json['itemCount']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'itemSize': serializer.toJson<String>(itemSize),
      'itemPrice': serializer.toJson<String>(itemPrice),
      'itemColor': serializer.toJson<String>(itemColor),
      'itemCount': serializer.toJson<int>(itemCount),
    };
  }

  UserCartData copyWith(
          {int? id,
          int? itemId,
          String? title,
          String? imageUrl,
          String? itemSize,
          String? itemPrice,
          String? itemColor,
          int? itemCount}) =>
      UserCartData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        itemSize: itemSize ?? this.itemSize,
        itemPrice: itemPrice ?? this.itemPrice,
        itemColor: itemColor ?? this.itemColor,
        itemCount: itemCount ?? this.itemCount,
      );

  @override
  String toString() {
    return (StringBuffer('UserCartData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('itemSize: $itemSize, ')
          ..write('itemPrice: $itemPrice, ')
          ..write('itemColor: $itemColor, ')
          ..write('itemCount: $itemCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, itemId, title, imageUrl, itemSize, itemPrice, itemColor, itemCount);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserCartData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.title == this.title &&
          other.imageUrl == this.imageUrl &&
          other.itemSize == this.itemSize &&
          other.itemPrice == this.itemPrice &&
          other.itemColor == this.itemColor &&
          other.itemCount == this.itemCount);
}

class UserCartCompanion extends UpdateCompanion<UserCartData> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> title;
  final Value<String> imageUrl;
  final Value<String> itemSize;
  final Value<String> itemPrice;
  final Value<String> itemColor;
  final Value<int> itemCount;

  const UserCartCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.title = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.itemSize = const Value.absent(),
    this.itemPrice = const Value.absent(),
    this.itemColor = const Value.absent(),
    this.itemCount = const Value.absent(),
  });

  UserCartCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String title,
    required String imageUrl,
    required String itemSize,
    required String itemPrice,
    required String itemColor,
    required int itemCount,
  })  : itemId = Value(itemId),
        title = Value(title),
        imageUrl = Value(imageUrl),
        itemSize = Value(itemSize),
        itemPrice = Value(itemPrice),
        itemColor = Value(itemColor),
        itemCount = Value(itemCount);

  static Insertable<UserCartData> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? title,
    Expression<String>? imageUrl,
    Expression<String>? itemSize,
    Expression<String>? itemPrice,
    Expression<String>? itemColor,
    Expression<int>? itemCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (title != null) 'title': title,
      if (imageUrl != null) 'image_url': imageUrl,
      if (itemSize != null) 'item_size': itemSize,
      if (itemPrice != null) 'item_price': itemPrice,
      if (itemColor != null) 'item_color': itemColor,
      if (itemCount != null) 'item_count': itemCount,
    });
  }

  UserCartCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<String>? title,
      Value<String>? imageUrl,
      Value<String>? itemSize,
      Value<String>? itemPrice,
      Value<String>? itemColor,
      Value<int>? itemCount}) {
    return UserCartCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      itemSize: itemSize ?? this.itemSize,
      itemPrice: itemPrice ?? this.itemPrice,
      itemColor: itemColor ?? this.itemColor,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (itemSize.present) {
      map['item_size'] = Variable<String>(itemSize.value);
    }
    if (itemPrice.present) {
      map['item_price'] = Variable<String>(itemPrice.value);
    }
    if (itemColor.present) {
      map['item_color'] = Variable<String>(itemColor.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCartCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('itemSize: $itemSize, ')
          ..write('itemPrice: $itemPrice, ')
          ..write('itemColor: $itemColor, ')
          ..write('itemCount: $itemCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserCartTable userCart = $UserCartTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userCart];
}
