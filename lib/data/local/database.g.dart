// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('cashier'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, username, password, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String password;
  final String role;
  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      role: Value(role),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
    };
  }

  User copyWith({int? id, String? username, String? password, String? role}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.role == this.role);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> role;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    this.role = const Value.absent(),
  }) : username = Value(username),
       password = Value(password);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? password,
    Value<String>? role,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retailPriceMeta = const VerificationMeta(
    'retailPrice',
  );
  @override
  late final GeneratedColumn<double> retailPrice = GeneratedColumn<double>(
    'retail_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wholesalePriceMeta = const VerificationMeta(
    'wholesalePrice',
  );
  @override
  late final GeneratedColumn<double> wholesalePrice = GeneratedColumn<double>(
    'wholesale_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retailPriceWithTaxMeta =
      const VerificationMeta('retailPriceWithTax');
  @override
  late final GeneratedColumn<double> retailPriceWithTax =
      GeneratedColumn<double>(
        'retail_price_with_tax',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _wholesalePriceWithTaxMeta =
      const VerificationMeta('wholesalePriceWithTax');
  @override
  late final GeneratedColumn<double> wholesalePriceWithTax =
      GeneratedColumn<double>(
        'wholesale_price_with_tax',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    retailPrice,
    wholesalePrice,
    retailPriceWithTax,
    wholesalePriceWithTax,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('retail_price')) {
      context.handle(
        _retailPriceMeta,
        retailPrice.isAcceptableOrUnknown(
          data['retail_price']!,
          _retailPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_retailPriceMeta);
    }
    if (data.containsKey('wholesale_price')) {
      context.handle(
        _wholesalePriceMeta,
        wholesalePrice.isAcceptableOrUnknown(
          data['wholesale_price']!,
          _wholesalePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wholesalePriceMeta);
    }
    if (data.containsKey('retail_price_with_tax')) {
      context.handle(
        _retailPriceWithTaxMeta,
        retailPriceWithTax.isAcceptableOrUnknown(
          data['retail_price_with_tax']!,
          _retailPriceWithTaxMeta,
        ),
      );
    }
    if (data.containsKey('wholesale_price_with_tax')) {
      context.handle(
        _wholesalePriceWithTaxMeta,
        wholesalePriceWithTax.isAcceptableOrUnknown(
          data['wholesale_price_with_tax']!,
          _wholesalePriceWithTaxMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      retailPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}retail_price'],
      )!,
      wholesalePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wholesale_price'],
      )!,
      retailPriceWithTax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}retail_price_with_tax'],
      ),
      wholesalePriceWithTax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wholesale_price_with_tax'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String name;
  final double retailPrice;
  final double wholesalePrice;
  final double? retailPriceWithTax;
  final double? wholesalePriceWithTax;
  final String? description;
  final DateTime createdAt;
  const Product({
    required this.id,
    required this.name,
    required this.retailPrice,
    required this.wholesalePrice,
    this.retailPriceWithTax,
    this.wholesalePriceWithTax,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['retail_price'] = Variable<double>(retailPrice);
    map['wholesale_price'] = Variable<double>(wholesalePrice);
    if (!nullToAbsent || retailPriceWithTax != null) {
      map['retail_price_with_tax'] = Variable<double>(retailPriceWithTax);
    }
    if (!nullToAbsent || wholesalePriceWithTax != null) {
      map['wholesale_price_with_tax'] = Variable<double>(wholesalePriceWithTax);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      retailPrice: Value(retailPrice),
      wholesalePrice: Value(wholesalePrice),
      retailPriceWithTax: retailPriceWithTax == null && nullToAbsent
          ? const Value.absent()
          : Value(retailPriceWithTax),
      wholesalePriceWithTax: wholesalePriceWithTax == null && nullToAbsent
          ? const Value.absent()
          : Value(wholesalePriceWithTax),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      retailPrice: serializer.fromJson<double>(json['retailPrice']),
      wholesalePrice: serializer.fromJson<double>(json['wholesalePrice']),
      retailPriceWithTax: serializer.fromJson<double?>(
        json['retailPriceWithTax'],
      ),
      wholesalePriceWithTax: serializer.fromJson<double?>(
        json['wholesalePriceWithTax'],
      ),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'retailPrice': serializer.toJson<double>(retailPrice),
      'wholesalePrice': serializer.toJson<double>(wholesalePrice),
      'retailPriceWithTax': serializer.toJson<double?>(retailPriceWithTax),
      'wholesalePriceWithTax': serializer.toJson<double?>(
        wholesalePriceWithTax,
      ),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Product copyWith({
    int? id,
    String? name,
    double? retailPrice,
    double? wholesalePrice,
    Value<double?> retailPriceWithTax = const Value.absent(),
    Value<double?> wholesalePriceWithTax = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    retailPrice: retailPrice ?? this.retailPrice,
    wholesalePrice: wholesalePrice ?? this.wholesalePrice,
    retailPriceWithTax: retailPriceWithTax.present
        ? retailPriceWithTax.value
        : this.retailPriceWithTax,
    wholesalePriceWithTax: wholesalePriceWithTax.present
        ? wholesalePriceWithTax.value
        : this.wholesalePriceWithTax,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      retailPrice: data.retailPrice.present
          ? data.retailPrice.value
          : this.retailPrice,
      wholesalePrice: data.wholesalePrice.present
          ? data.wholesalePrice.value
          : this.wholesalePrice,
      retailPriceWithTax: data.retailPriceWithTax.present
          ? data.retailPriceWithTax.value
          : this.retailPriceWithTax,
      wholesalePriceWithTax: data.wholesalePriceWithTax.present
          ? data.wholesalePriceWithTax.value
          : this.wholesalePriceWithTax,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('retailPrice: $retailPrice, ')
          ..write('wholesalePrice: $wholesalePrice, ')
          ..write('retailPriceWithTax: $retailPriceWithTax, ')
          ..write('wholesalePriceWithTax: $wholesalePriceWithTax, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    retailPrice,
    wholesalePrice,
    retailPriceWithTax,
    wholesalePriceWithTax,
    description,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.retailPrice == this.retailPrice &&
          other.wholesalePrice == this.wholesalePrice &&
          other.retailPriceWithTax == this.retailPriceWithTax &&
          other.wholesalePriceWithTax == this.wholesalePriceWithTax &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> retailPrice;
  final Value<double> wholesalePrice;
  final Value<double?> retailPriceWithTax;
  final Value<double?> wholesalePriceWithTax;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.retailPrice = const Value.absent(),
    this.wholesalePrice = const Value.absent(),
    this.retailPriceWithTax = const Value.absent(),
    this.wholesalePriceWithTax = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double retailPrice,
    required double wholesalePrice,
    this.retailPriceWithTax = const Value.absent(),
    this.wholesalePriceWithTax = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       retailPrice = Value(retailPrice),
       wholesalePrice = Value(wholesalePrice);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? retailPrice,
    Expression<double>? wholesalePrice,
    Expression<double>? retailPriceWithTax,
    Expression<double>? wholesalePriceWithTax,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (retailPrice != null) 'retail_price': retailPrice,
      if (wholesalePrice != null) 'wholesale_price': wholesalePrice,
      if (retailPriceWithTax != null)
        'retail_price_with_tax': retailPriceWithTax,
      if (wholesalePriceWithTax != null)
        'wholesale_price_with_tax': wholesalePriceWithTax,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? retailPrice,
    Value<double>? wholesalePrice,
    Value<double?>? retailPriceWithTax,
    Value<double?>? wholesalePriceWithTax,
    Value<String?>? description,
    Value<DateTime>? createdAt,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      retailPrice: retailPrice ?? this.retailPrice,
      wholesalePrice: wholesalePrice ?? this.wholesalePrice,
      retailPriceWithTax: retailPriceWithTax ?? this.retailPriceWithTax,
      wholesalePriceWithTax:
          wholesalePriceWithTax ?? this.wholesalePriceWithTax,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (retailPrice.present) {
      map['retail_price'] = Variable<double>(retailPrice.value);
    }
    if (wholesalePrice.present) {
      map['wholesale_price'] = Variable<double>(wholesalePrice.value);
    }
    if (retailPriceWithTax.present) {
      map['retail_price_with_tax'] = Variable<double>(retailPriceWithTax.value);
    }
    if (wholesalePriceWithTax.present) {
      map['wholesale_price_with_tax'] = Variable<double>(
        wholesalePriceWithTax.value,
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('retailPrice: $retailPrice, ')
          ..write('wholesalePrice: $wholesalePrice, ')
          ..write('retailPriceWithTax: $retailPriceWithTax, ')
          ..write('wholesalePriceWithTax: $wholesalePriceWithTax, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StoresTable extends Stores with TableInfo<$StoresTable, Store> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, address, phone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stores';
  @override
  VerificationContext validateIntegrity(
    Insertable<Store> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Store map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Store(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
    );
  }

  @override
  $StoresTable createAlias(String alias) {
    return $StoresTable(attachedDatabase, alias);
  }
}

class Store extends DataClass implements Insertable<Store> {
  final int id;
  final String name;
  final String? address;
  final String? phone;
  const Store({required this.id, required this.name, this.address, this.phone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    return map;
  }

  StoresCompanion toCompanion(bool nullToAbsent) {
    return StoresCompanion(
      id: Value(id),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
    );
  }

  factory Store.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Store(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
    };
  }

  Store copyWith({
    int? id,
    String? name,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
  }) => Store(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
  );
  Store copyWithCompanion(StoresCompanion data) {
    return Store(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Store(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.phone == this.phone);
}

class StoresCompanion extends UpdateCompanion<Store> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<String?> phone;
  const StoresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
  });
  StoresCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Store> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
    });
  }

  StoresCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? address,
    Value<String?>? phone,
  }) {
    return StoresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }
}

class $StoreSettingsTable extends StoreSettings
    with TableInfo<$StoreSettingsTable, StoreSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _storeIdMeta = const VerificationMeta(
    'storeId',
  );
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
    'store_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES stores(id)',
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, storeId, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoreSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('store_id')) {
      context.handle(
        _storeIdMeta,
        storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      storeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}store_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $StoreSettingsTable createAlias(String alias) {
    return $StoreSettingsTable(attachedDatabase, alias);
  }
}

class StoreSetting extends DataClass implements Insertable<StoreSetting> {
  final int id;
  final int storeId;
  final String key;
  final String value;
  const StoreSetting({
    required this.id,
    required this.storeId,
    required this.key,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['store_id'] = Variable<int>(storeId);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  StoreSettingsCompanion toCompanion(bool nullToAbsent) {
    return StoreSettingsCompanion(
      id: Value(id),
      storeId: Value(storeId),
      key: Value(key),
      value: Value(value),
    );
  }

  factory StoreSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreSetting(
      id: serializer.fromJson<int>(json['id']),
      storeId: serializer.fromJson<int>(json['storeId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storeId': serializer.toJson<int>(storeId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  StoreSetting copyWith({int? id, int? storeId, String? key, String? value}) =>
      StoreSetting(
        id: id ?? this.id,
        storeId: storeId ?? this.storeId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  StoreSetting copyWithCompanion(StoreSettingsCompanion data) {
    return StoreSetting(
      id: data.id.present ? data.id.value : this.id,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoreSetting(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, storeId, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreSetting &&
          other.id == this.id &&
          other.storeId == this.storeId &&
          other.key == this.key &&
          other.value == this.value);
}

class StoreSettingsCompanion extends UpdateCompanion<StoreSetting> {
  final Value<int> id;
  final Value<int> storeId;
  final Value<String> key;
  final Value<String> value;
  const StoreSettingsCompanion({
    this.id = const Value.absent(),
    this.storeId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  StoreSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int storeId,
    required String key,
    required String value,
  }) : storeId = Value(storeId),
       key = Value(key),
       value = Value(value);
  static Insertable<StoreSetting> custom({
    Expression<int>? id,
    Expression<int>? storeId,
    Expression<String>? key,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeId != null) 'store_id': storeId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  StoreSettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? storeId,
    Value<String>? key,
    Value<String>? value,
  }) {
    return StoreSettingsCompanion(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreSettingsCompanion(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storeIdMeta = const VerificationMeta(
    'storeId',
  );
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
    'store_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES stores(id)',
  );
  static const VerificationMeta _customerTypeMeta = const VerificationMeta(
    'customerType',
  );
  @override
  late final GeneratedColumn<String> customerType = GeneratedColumn<String>(
    'customer_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('WALK_IN'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    address,
    email,
    storeId,
    customerType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('store_id')) {
      context.handle(
        _storeIdMeta,
        storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('customer_type')) {
      context.handle(
        _customerTypeMeta,
        customerType.isAcceptableOrUnknown(
          data['customer_type']!,
          _customerTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      storeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}store_id'],
      )!,
      customerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_type'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String name;
  final String? phone;
  final String? address;
  final String? email;
  final int storeId;
  final String customerType;
  const Customer({
    required this.id,
    required this.name,
    this.phone,
    this.address,
    this.email,
    required this.storeId,
    required this.customerType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['store_id'] = Variable<int>(storeId);
    map['customer_type'] = Variable<String>(customerType);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      storeId: Value(storeId),
      customerType: Value(customerType),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      email: serializer.fromJson<String?>(json['email']),
      storeId: serializer.fromJson<int>(json['storeId']),
      customerType: serializer.fromJson<String>(json['customerType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'email': serializer.toJson<String?>(email),
      'storeId': serializer.toJson<int>(storeId),
      'customerType': serializer.toJson<String>(customerType),
    };
  }

  Customer copyWith({
    int? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> email = const Value.absent(),
    int? storeId,
    String? customerType,
  }) => Customer(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    email: email.present ? email.value : this.email,
    storeId: storeId ?? this.storeId,
    customerType: customerType ?? this.customerType,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      email: data.email.present ? data.email.value : this.email,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      customerType: data.customerType.present
          ? data.customerType.value
          : this.customerType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('storeId: $storeId, ')
          ..write('customerType: $customerType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phone, address, email, storeId, customerType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.email == this.email &&
          other.storeId == this.storeId &&
          other.customerType == this.customerType);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> email;
  final Value<int> storeId;
  final Value<String> customerType;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.storeId = const Value.absent(),
    this.customerType = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    required int storeId,
    this.customerType = const Value.absent(),
  }) : name = Value(name),
       storeId = Value(storeId);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? email,
    Expression<int>? storeId,
    Expression<String>? customerType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (email != null) 'email': email,
      if (storeId != null) 'store_id': storeId,
      if (customerType != null) 'customer_type': customerType,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String?>? email,
    Value<int>? storeId,
    Value<String>? customerType,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      email: email ?? this.email,
      storeId: storeId ?? this.storeId,
      customerType: customerType ?? this.customerType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (customerType.present) {
      map['customer_type'] = Variable<String>(customerType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('storeId: $storeId, ')
          ..write('customerType: $customerType')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES customers(id)',
  );
  static const VerificationMeta _orderDateMeta = const VerificationMeta(
    'orderDate',
  );
  @override
  late final GeneratedColumn<DateTime> orderDate = GeneratedColumn<DateTime>(
    'order_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderStatusMeta = const VerificationMeta(
    'orderStatus',
  );
  @override
  late final GeneratedColumn<String> orderStatus = GeneratedColumn<String>(
    'order_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('PENDING'),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('NOT_PAID'),
  );
  static const VerificationMeta _orderTypeMeta = const VerificationMeta(
    'orderType',
  );
  @override
  late final GeneratedColumn<String> orderType = GeneratedColumn<String>(
    'order_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deliveryRequiredMeta = const VerificationMeta(
    'deliveryRequired',
  );
  @override
  late final GeneratedColumn<bool> deliveryRequired = GeneratedColumn<bool>(
    'delivery_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("delivery_required" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _storeIdMeta = const VerificationMeta(
    'storeId',
  );
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
    'store_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES stores(id)',
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES users(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    orderDate,
    totalAmount,
    orderStatus,
    paymentMethod,
    paymentStatus,
    orderType,
    deliveryRequired,
    storeId,
    phoneNumber,
    createdBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Order> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('order_date')) {
      context.handle(
        _orderDateMeta,
        orderDate.isAcceptableOrUnknown(data['order_date']!, _orderDateMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('order_status')) {
      context.handle(
        _orderStatusMeta,
        orderStatus.isAcceptableOrUnknown(
          data['order_status']!,
          _orderStatusMeta,
        ),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    if (data.containsKey('order_type')) {
      context.handle(
        _orderTypeMeta,
        orderType.isAcceptableOrUnknown(data['order_type']!, _orderTypeMeta),
      );
    }
    if (data.containsKey('delivery_required')) {
      context.handle(
        _deliveryRequiredMeta,
        deliveryRequired.isAcceptableOrUnknown(
          data['delivery_required']!,
          _deliveryRequiredMeta,
        ),
      );
    }
    if (data.containsKey('store_id')) {
      context.handle(
        _storeIdMeta,
        storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
      orderDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}order_date'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      orderStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_status'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      orderType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_type'],
      ),
      deliveryRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}delivery_required'],
      )!,
      storeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}store_id'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_by'],
      ),
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final int customerId;
  final DateTime orderDate;
  final double totalAmount;
  final String orderStatus;
  final String? paymentMethod;
  final String paymentStatus;
  final String? orderType;
  final bool deliveryRequired;
  final int storeId;
  final String phoneNumber;
  final int? createdBy;
  const Order({
    required this.id,
    required this.customerId,
    required this.orderDate,
    required this.totalAmount,
    required this.orderStatus,
    this.paymentMethod,
    required this.paymentStatus,
    this.orderType,
    required this.deliveryRequired,
    required this.storeId,
    required this.phoneNumber,
    this.createdBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_id'] = Variable<int>(customerId);
    map['order_date'] = Variable<DateTime>(orderDate);
    map['total_amount'] = Variable<double>(totalAmount);
    map['order_status'] = Variable<String>(orderStatus);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || orderType != null) {
      map['order_type'] = Variable<String>(orderType);
    }
    map['delivery_required'] = Variable<bool>(deliveryRequired);
    map['store_id'] = Variable<int>(storeId);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<int>(createdBy);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      customerId: Value(customerId),
      orderDate: Value(orderDate),
      totalAmount: Value(totalAmount),
      orderStatus: Value(orderStatus),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      orderType: orderType == null && nullToAbsent
          ? const Value.absent()
          : Value(orderType),
      deliveryRequired: Value(deliveryRequired),
      storeId: Value(storeId),
      phoneNumber: Value(phoneNumber),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory Order.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      customerId: serializer.fromJson<int>(json['customerId']),
      orderDate: serializer.fromJson<DateTime>(json['orderDate']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      orderStatus: serializer.fromJson<String>(json['orderStatus']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      orderType: serializer.fromJson<String?>(json['orderType']),
      deliveryRequired: serializer.fromJson<bool>(json['deliveryRequired']),
      storeId: serializer.fromJson<int>(json['storeId']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      createdBy: serializer.fromJson<int?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerId': serializer.toJson<int>(customerId),
      'orderDate': serializer.toJson<DateTime>(orderDate),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'orderStatus': serializer.toJson<String>(orderStatus),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'orderType': serializer.toJson<String?>(orderType),
      'deliveryRequired': serializer.toJson<bool>(deliveryRequired),
      'storeId': serializer.toJson<int>(storeId),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'createdBy': serializer.toJson<int?>(createdBy),
    };
  }

  Order copyWith({
    int? id,
    int? customerId,
    DateTime? orderDate,
    double? totalAmount,
    String? orderStatus,
    Value<String?> paymentMethod = const Value.absent(),
    String? paymentStatus,
    Value<String?> orderType = const Value.absent(),
    bool? deliveryRequired,
    int? storeId,
    String? phoneNumber,
    Value<int?> createdBy = const Value.absent(),
  }) => Order(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    orderDate: orderDate ?? this.orderDate,
    totalAmount: totalAmount ?? this.totalAmount,
    orderStatus: orderStatus ?? this.orderStatus,
    paymentMethod: paymentMethod.present
        ? paymentMethod.value
        : this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    orderType: orderType.present ? orderType.value : this.orderType,
    deliveryRequired: deliveryRequired ?? this.deliveryRequired,
    storeId: storeId ?? this.storeId,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
  );
  Order copyWithCompanion(OrdersCompanion data) {
    return Order(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      orderDate: data.orderDate.present ? data.orderDate.value : this.orderDate,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      orderStatus: data.orderStatus.present
          ? data.orderStatus.value
          : this.orderStatus,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      deliveryRequired: data.deliveryRequired.present
          ? data.deliveryRequired.value
          : this.deliveryRequired,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('orderDate: $orderDate, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('orderType: $orderType, ')
          ..write('deliveryRequired: $deliveryRequired, ')
          ..write('storeId: $storeId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    customerId,
    orderDate,
    totalAmount,
    orderStatus,
    paymentMethod,
    paymentStatus,
    orderType,
    deliveryRequired,
    storeId,
    phoneNumber,
    createdBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.orderDate == this.orderDate &&
          other.totalAmount == this.totalAmount &&
          other.orderStatus == this.orderStatus &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus &&
          other.orderType == this.orderType &&
          other.deliveryRequired == this.deliveryRequired &&
          other.storeId == this.storeId &&
          other.phoneNumber == this.phoneNumber &&
          other.createdBy == this.createdBy);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<int> customerId;
  final Value<DateTime> orderDate;
  final Value<double> totalAmount;
  final Value<String> orderStatus;
  final Value<String?> paymentMethod;
  final Value<String> paymentStatus;
  final Value<String?> orderType;
  final Value<bool> deliveryRequired;
  final Value<int> storeId;
  final Value<String> phoneNumber;
  final Value<int?> createdBy;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.orderType = const Value.absent(),
    this.deliveryRequired = const Value.absent(),
    this.storeId = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.createdBy = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required int customerId,
    this.orderDate = const Value.absent(),
    required double totalAmount,
    this.orderStatus = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.orderType = const Value.absent(),
    this.deliveryRequired = const Value.absent(),
    required int storeId,
    required String phoneNumber,
    this.createdBy = const Value.absent(),
  }) : customerId = Value(customerId),
       totalAmount = Value(totalAmount),
       storeId = Value(storeId),
       phoneNumber = Value(phoneNumber);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<int>? customerId,
    Expression<DateTime>? orderDate,
    Expression<double>? totalAmount,
    Expression<String>? orderStatus,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
    Expression<String>? orderType,
    Expression<bool>? deliveryRequired,
    Expression<int>? storeId,
    Expression<String>? phoneNumber,
    Expression<int>? createdBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (orderDate != null) 'order_date': orderDate,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (orderStatus != null) 'order_status': orderStatus,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (orderType != null) 'order_type': orderType,
      if (deliveryRequired != null) 'delivery_required': deliveryRequired,
      if (storeId != null) 'store_id': storeId,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (createdBy != null) 'created_by': createdBy,
    });
  }

  OrdersCompanion copyWith({
    Value<int>? id,
    Value<int>? customerId,
    Value<DateTime>? orderDate,
    Value<double>? totalAmount,
    Value<String>? orderStatus,
    Value<String?>? paymentMethod,
    Value<String>? paymentStatus,
    Value<String?>? orderType,
    Value<bool>? deliveryRequired,
    Value<int>? storeId,
    Value<String>? phoneNumber,
    Value<int?>? createdBy,
  }) {
    return OrdersCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      orderDate: orderDate ?? this.orderDate,
      totalAmount: totalAmount ?? this.totalAmount,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      orderType: orderType ?? this.orderType,
      deliveryRequired: deliveryRequired ?? this.deliveryRequired,
      storeId: storeId ?? this.storeId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<String>(orderStatus.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (deliveryRequired.present) {
      map['delivery_required'] = Variable<bool>(deliveryRequired.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('orderDate: $orderDate, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('orderType: $orderType, ')
          ..write('deliveryRequired: $deliveryRequired, ')
          ..write('storeId: $storeId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTable extends OrderItems
    with TableInfo<$OrderItemsTable, OrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES products(id)',
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buyingPriceMeta = const VerificationMeta(
    'buyingPrice',
  );
  @override
  late final GeneratedColumn<double> buyingPrice = GeneratedColumn<double>(
    'buying_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxAmountMeta = const VerificationMeta(
    'taxAmount',
  );
  @override
  late final GeneratedColumn<double> taxAmount = GeneratedColumn<double>(
    'tax_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _storeIdMeta = const VerificationMeta(
    'storeId',
  );
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
    'store_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES stores(id)',
  );
  static const VerificationMeta _saleTypeMeta = const VerificationMeta(
    'saleType',
  );
  @override
  late final GeneratedColumn<String> saleType = GeneratedColumn<String>(
    'sale_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('RETAIL'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    productId,
    quantity,
    price,
    buyingPrice,
    taxAmount,
    storeId,
    saleType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('buying_price')) {
      context.handle(
        _buyingPriceMeta,
        buyingPrice.isAcceptableOrUnknown(
          data['buying_price']!,
          _buyingPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_buyingPriceMeta);
    }
    if (data.containsKey('tax_amount')) {
      context.handle(
        _taxAmountMeta,
        taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_taxAmountMeta);
    }
    if (data.containsKey('store_id')) {
      context.handle(
        _storeIdMeta,
        storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('sale_type')) {
      context.handle(
        _saleTypeMeta,
        saleType.isAcceptableOrUnknown(data['sale_type']!, _saleTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      buyingPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}buying_price'],
      )!,
      taxAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_amount'],
      )!,
      storeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}store_id'],
      )!,
      saleType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_type'],
      )!,
    );
  }

  @override
  $OrderItemsTable createAlias(String alias) {
    return $OrderItemsTable(attachedDatabase, alias);
  }
}

class OrderItem extends DataClass implements Insertable<OrderItem> {
  final int id;
  final int orderId;
  final int productId;
  final int quantity;
  final double price;
  final double buyingPrice;
  final double taxAmount;
  final int storeId;
  final String saleType;
  const OrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.buyingPrice,
    required this.taxAmount,
    required this.storeId,
    required this.saleType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    map['buying_price'] = Variable<double>(buyingPrice);
    map['tax_amount'] = Variable<double>(taxAmount);
    map['store_id'] = Variable<int>(storeId);
    map['sale_type'] = Variable<String>(saleType);
    return map;
  }

  OrderItemsCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      quantity: Value(quantity),
      price: Value(price),
      buyingPrice: Value(buyingPrice),
      taxAmount: Value(taxAmount),
      storeId: Value(storeId),
      saleType: Value(saleType),
    );
  }

  factory OrderItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItem(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      buyingPrice: serializer.fromJson<double>(json['buyingPrice']),
      taxAmount: serializer.fromJson<double>(json['taxAmount']),
      storeId: serializer.fromJson<int>(json['storeId']),
      saleType: serializer.fromJson<String>(json['saleType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
      'buyingPrice': serializer.toJson<double>(buyingPrice),
      'taxAmount': serializer.toJson<double>(taxAmount),
      'storeId': serializer.toJson<int>(storeId),
      'saleType': serializer.toJson<String>(saleType),
    };
  }

  OrderItem copyWith({
    int? id,
    int? orderId,
    int? productId,
    int? quantity,
    double? price,
    double? buyingPrice,
    double? taxAmount,
    int? storeId,
    String? saleType,
  }) => OrderItem(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    buyingPrice: buyingPrice ?? this.buyingPrice,
    taxAmount: taxAmount ?? this.taxAmount,
    storeId: storeId ?? this.storeId,
    saleType: saleType ?? this.saleType,
  );
  OrderItem copyWithCompanion(OrderItemsCompanion data) {
    return OrderItem(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      buyingPrice: data.buyingPrice.present
          ? data.buyingPrice.value
          : this.buyingPrice,
      taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      saleType: data.saleType.present ? data.saleType.value : this.saleType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItem(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('storeId: $storeId, ')
          ..write('saleType: $saleType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    productId,
    quantity,
    price,
    buyingPrice,
    taxAmount,
    storeId,
    saleType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItem &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.buyingPrice == this.buyingPrice &&
          other.taxAmount == this.taxAmount &&
          other.storeId == this.storeId &&
          other.saleType == this.saleType);
}

class OrderItemsCompanion extends UpdateCompanion<OrderItem> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<int> productId;
  final Value<int> quantity;
  final Value<double> price;
  final Value<double> buyingPrice;
  final Value<double> taxAmount;
  final Value<int> storeId;
  final Value<String> saleType;
  const OrderItemsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.buyingPrice = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.storeId = const Value.absent(),
    this.saleType = const Value.absent(),
  });
  OrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required int productId,
    required int quantity,
    required double price,
    required double buyingPrice,
    required double taxAmount,
    required int storeId,
    this.saleType = const Value.absent(),
  }) : orderId = Value(orderId),
       productId = Value(productId),
       quantity = Value(quantity),
       price = Value(price),
       buyingPrice = Value(buyingPrice),
       taxAmount = Value(taxAmount),
       storeId = Value(storeId);
  static Insertable<OrderItem> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<int>? productId,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<double>? buyingPrice,
    Expression<double>? taxAmount,
    Expression<int>? storeId,
    Expression<String>? saleType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (buyingPrice != null) 'buying_price': buyingPrice,
      if (taxAmount != null) 'tax_amount': taxAmount,
      if (storeId != null) 'store_id': storeId,
      if (saleType != null) 'sale_type': saleType,
    });
  }

  OrderItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<int>? productId,
    Value<int>? quantity,
    Value<double>? price,
    Value<double>? buyingPrice,
    Value<double>? taxAmount,
    Value<int>? storeId,
    Value<String>? saleType,
  }) {
    return OrderItemsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      taxAmount: taxAmount ?? this.taxAmount,
      storeId: storeId ?? this.storeId,
      saleType: saleType ?? this.saleType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (buyingPrice.present) {
      map['buying_price'] = Variable<double>(buyingPrice.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<double>(taxAmount.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (saleType.present) {
      map['sale_type'] = Variable<String>(saleType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('storeId: $storeId, ')
          ..write('saleType: $saleType')
          ..write(')'))
        .toString();
  }
}

class $CreditPlansTable extends CreditPlans
    with TableInfo<$CreditPlansTable, CreditPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberOfInstallmentsMeta =
      const VerificationMeta('numberOfInstallments');
  @override
  late final GeneratedColumn<int> numberOfInstallments = GeneratedColumn<int>(
    'number_of_installments',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(1),
  );
  static const VerificationMeta _installmentAmountMeta = const VerificationMeta(
    'installmentAmount',
  );
  @override
  late final GeneratedColumn<double> installmentAmount =
      GeneratedColumn<double>(
        'installment_amount',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _finalAmountMeta = const VerificationMeta(
    'finalAmount',
  );
  @override
  late final GeneratedColumn<double> finalAmount = GeneratedColumn<double>(
    'final_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalPaidMeta = const VerificationMeta(
    'totalPaid',
  );
  @override
  late final GeneratedColumn<double> totalPaid = GeneratedColumn<double>(
    'total_paid',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _gracePeriodDaysMeta = const VerificationMeta(
    'gracePeriodDays',
  );
  @override
  late final GeneratedColumn<int> gracePeriodDays = GeneratedColumn<int>(
    'grace_period_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _nextDueDateMeta = const VerificationMeta(
    'nextDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
    'next_due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('ACTIVE'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    startDate,
    dueDate,
    numberOfInstallments,
    installmentAmount,
    finalAmount,
    totalPaid,
    gracePeriodDays,
    nextDueDate,
    status,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credit_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('number_of_installments')) {
      context.handle(
        _numberOfInstallmentsMeta,
        numberOfInstallments.isAcceptableOrUnknown(
          data['number_of_installments']!,
          _numberOfInstallmentsMeta,
        ),
      );
    }
    if (data.containsKey('installment_amount')) {
      context.handle(
        _installmentAmountMeta,
        installmentAmount.isAcceptableOrUnknown(
          data['installment_amount']!,
          _installmentAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_installmentAmountMeta);
    }
    if (data.containsKey('final_amount')) {
      context.handle(
        _finalAmountMeta,
        finalAmount.isAcceptableOrUnknown(
          data['final_amount']!,
          _finalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finalAmountMeta);
    }
    if (data.containsKey('total_paid')) {
      context.handle(
        _totalPaidMeta,
        totalPaid.isAcceptableOrUnknown(data['total_paid']!, _totalPaidMeta),
      );
    }
    if (data.containsKey('grace_period_days')) {
      context.handle(
        _gracePeriodDaysMeta,
        gracePeriodDays.isAcceptableOrUnknown(
          data['grace_period_days']!,
          _gracePeriodDaysMeta,
        ),
      );
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
        _nextDueDateMeta,
        nextDueDate.isAcceptableOrUnknown(
          data['next_due_date']!,
          _nextDueDateMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      numberOfInstallments: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_installments'],
      )!,
      installmentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}installment_amount'],
      )!,
      finalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_amount'],
      )!,
      totalPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_paid'],
      )!,
      gracePeriodDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grace_period_days'],
      )!,
      nextDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CreditPlansTable createAlias(String alias) {
    return $CreditPlansTable(attachedDatabase, alias);
  }
}

class CreditPlan extends DataClass implements Insertable<CreditPlan> {
  final int id;
  final int orderId;
  final DateTime startDate;
  final DateTime dueDate;
  final int numberOfInstallments;
  final double installmentAmount;
  final double finalAmount;
  final double totalPaid;
  final int gracePeriodDays;
  final DateTime? nextDueDate;
  final String status;
  final String? notes;
  const CreditPlan({
    required this.id,
    required this.orderId,
    required this.startDate,
    required this.dueDate,
    required this.numberOfInstallments,
    required this.installmentAmount,
    required this.finalAmount,
    required this.totalPaid,
    required this.gracePeriodDays,
    this.nextDueDate,
    required this.status,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['start_date'] = Variable<DateTime>(startDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['number_of_installments'] = Variable<int>(numberOfInstallments);
    map['installment_amount'] = Variable<double>(installmentAmount);
    map['final_amount'] = Variable<double>(finalAmount);
    map['total_paid'] = Variable<double>(totalPaid);
    map['grace_period_days'] = Variable<int>(gracePeriodDays);
    if (!nullToAbsent || nextDueDate != null) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CreditPlansCompanion toCompanion(bool nullToAbsent) {
    return CreditPlansCompanion(
      id: Value(id),
      orderId: Value(orderId),
      startDate: Value(startDate),
      dueDate: Value(dueDate),
      numberOfInstallments: Value(numberOfInstallments),
      installmentAmount: Value(installmentAmount),
      finalAmount: Value(finalAmount),
      totalPaid: Value(totalPaid),
      gracePeriodDays: Value(gracePeriodDays),
      nextDueDate: nextDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueDate),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CreditPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditPlan(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      numberOfInstallments: serializer.fromJson<int>(
        json['numberOfInstallments'],
      ),
      installmentAmount: serializer.fromJson<double>(json['installmentAmount']),
      finalAmount: serializer.fromJson<double>(json['finalAmount']),
      totalPaid: serializer.fromJson<double>(json['totalPaid']),
      gracePeriodDays: serializer.fromJson<int>(json['gracePeriodDays']),
      nextDueDate: serializer.fromJson<DateTime?>(json['nextDueDate']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'numberOfInstallments': serializer.toJson<int>(numberOfInstallments),
      'installmentAmount': serializer.toJson<double>(installmentAmount),
      'finalAmount': serializer.toJson<double>(finalAmount),
      'totalPaid': serializer.toJson<double>(totalPaid),
      'gracePeriodDays': serializer.toJson<int>(gracePeriodDays),
      'nextDueDate': serializer.toJson<DateTime?>(nextDueDate),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CreditPlan copyWith({
    int? id,
    int? orderId,
    DateTime? startDate,
    DateTime? dueDate,
    int? numberOfInstallments,
    double? installmentAmount,
    double? finalAmount,
    double? totalPaid,
    int? gracePeriodDays,
    Value<DateTime?> nextDueDate = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
  }) => CreditPlan(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    startDate: startDate ?? this.startDate,
    dueDate: dueDate ?? this.dueDate,
    numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
    installmentAmount: installmentAmount ?? this.installmentAmount,
    finalAmount: finalAmount ?? this.finalAmount,
    totalPaid: totalPaid ?? this.totalPaid,
    gracePeriodDays: gracePeriodDays ?? this.gracePeriodDays,
    nextDueDate: nextDueDate.present ? nextDueDate.value : this.nextDueDate,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
  );
  CreditPlan copyWithCompanion(CreditPlansCompanion data) {
    return CreditPlan(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      numberOfInstallments: data.numberOfInstallments.present
          ? data.numberOfInstallments.value
          : this.numberOfInstallments,
      installmentAmount: data.installmentAmount.present
          ? data.installmentAmount.value
          : this.installmentAmount,
      finalAmount: data.finalAmount.present
          ? data.finalAmount.value
          : this.finalAmount,
      totalPaid: data.totalPaid.present ? data.totalPaid.value : this.totalPaid,
      gracePeriodDays: data.gracePeriodDays.present
          ? data.gracePeriodDays.value
          : this.gracePeriodDays,
      nextDueDate: data.nextDueDate.present
          ? data.nextDueDate.value
          : this.nextDueDate,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditPlan(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('numberOfInstallments: $numberOfInstallments, ')
          ..write('installmentAmount: $installmentAmount, ')
          ..write('finalAmount: $finalAmount, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('gracePeriodDays: $gracePeriodDays, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    startDate,
    dueDate,
    numberOfInstallments,
    installmentAmount,
    finalAmount,
    totalPaid,
    gracePeriodDays,
    nextDueDate,
    status,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditPlan &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.startDate == this.startDate &&
          other.dueDate == this.dueDate &&
          other.numberOfInstallments == this.numberOfInstallments &&
          other.installmentAmount == this.installmentAmount &&
          other.finalAmount == this.finalAmount &&
          other.totalPaid == this.totalPaid &&
          other.gracePeriodDays == this.gracePeriodDays &&
          other.nextDueDate == this.nextDueDate &&
          other.status == this.status &&
          other.notes == this.notes);
}

class CreditPlansCompanion extends UpdateCompanion<CreditPlan> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<DateTime> startDate;
  final Value<DateTime> dueDate;
  final Value<int> numberOfInstallments;
  final Value<double> installmentAmount;
  final Value<double> finalAmount;
  final Value<double> totalPaid;
  final Value<int> gracePeriodDays;
  final Value<DateTime?> nextDueDate;
  final Value<String> status;
  final Value<String?> notes;
  const CreditPlansCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.numberOfInstallments = const Value.absent(),
    this.installmentAmount = const Value.absent(),
    this.finalAmount = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.gracePeriodDays = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
  });
  CreditPlansCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required DateTime startDate,
    required DateTime dueDate,
    this.numberOfInstallments = const Value.absent(),
    required double installmentAmount,
    required double finalAmount,
    this.totalPaid = const Value.absent(),
    this.gracePeriodDays = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
  }) : orderId = Value(orderId),
       startDate = Value(startDate),
       dueDate = Value(dueDate),
       installmentAmount = Value(installmentAmount),
       finalAmount = Value(finalAmount);
  static Insertable<CreditPlan> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? dueDate,
    Expression<int>? numberOfInstallments,
    Expression<double>? installmentAmount,
    Expression<double>? finalAmount,
    Expression<double>? totalPaid,
    Expression<int>? gracePeriodDays,
    Expression<DateTime>? nextDueDate,
    Expression<String>? status,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (startDate != null) 'start_date': startDate,
      if (dueDate != null) 'due_date': dueDate,
      if (numberOfInstallments != null)
        'number_of_installments': numberOfInstallments,
      if (installmentAmount != null) 'installment_amount': installmentAmount,
      if (finalAmount != null) 'final_amount': finalAmount,
      if (totalPaid != null) 'total_paid': totalPaid,
      if (gracePeriodDays != null) 'grace_period_days': gracePeriodDays,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
    });
  }

  CreditPlansCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<DateTime>? startDate,
    Value<DateTime>? dueDate,
    Value<int>? numberOfInstallments,
    Value<double>? installmentAmount,
    Value<double>? finalAmount,
    Value<double>? totalPaid,
    Value<int>? gracePeriodDays,
    Value<DateTime?>? nextDueDate,
    Value<String>? status,
    Value<String?>? notes,
  }) {
    return CreditPlansCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
      installmentAmount: installmentAmount ?? this.installmentAmount,
      finalAmount: finalAmount ?? this.finalAmount,
      totalPaid: totalPaid ?? this.totalPaid,
      gracePeriodDays: gracePeriodDays ?? this.gracePeriodDays,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (numberOfInstallments.present) {
      map['number_of_installments'] = Variable<int>(numberOfInstallments.value);
    }
    if (installmentAmount.present) {
      map['installment_amount'] = Variable<double>(installmentAmount.value);
    }
    if (finalAmount.present) {
      map['final_amount'] = Variable<double>(finalAmount.value);
    }
    if (totalPaid.present) {
      map['total_paid'] = Variable<double>(totalPaid.value);
    }
    if (gracePeriodDays.present) {
      map['grace_period_days'] = Variable<int>(gracePeriodDays.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditPlansCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('numberOfInstallments: $numberOfInstallments, ')
          ..write('installmentAmount: $installmentAmount, ')
          ..write('finalAmount: $finalAmount, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('gracePeriodDays: $gracePeriodDays, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $InstallmentPaymentsTable extends InstallmentPayments
    with TableInfo<$InstallmentPaymentsTable, InstallmentPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstallmentPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<int> planId = GeneratedColumn<int>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES credit_plans(id)',
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountDueMeta = const VerificationMeta(
    'amountDue',
  );
  @override
  late final GeneratedColumn<double> amountDue = GeneratedColumn<double>(
    'amount_due',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountPaidMeta = const VerificationMeta(
    'amountPaid',
  );
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
    'amount_paid',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _paidDateMeta = const VerificationMeta(
    'paidDate',
  );
  @override
  late final GeneratedColumn<DateTime> paidDate = GeneratedColumn<DateTime>(
    'paid_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('ACTIVE'),
  );
  static const VerificationMeta _reminderSentMeta = const VerificationMeta(
    'reminderSent',
  );
  @override
  late final GeneratedColumn<bool> reminderSent = GeneratedColumn<bool>(
    'reminder_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_sent" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _lastReminderAtMeta = const VerificationMeta(
    'lastReminderAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReminderAt =
      GeneratedColumn<DateTime>(
        'last_reminder_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planId,
    dueDate,
    amountDue,
    amountPaid,
    paidDate,
    status,
    reminderSent,
    lastReminderAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'installment_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<InstallmentPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('amount_due')) {
      context.handle(
        _amountDueMeta,
        amountDue.isAcceptableOrUnknown(data['amount_due']!, _amountDueMeta),
      );
    } else if (isInserting) {
      context.missing(_amountDueMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
        _amountPaidMeta,
        amountPaid.isAcceptableOrUnknown(data['amount_paid']!, _amountPaidMeta),
      );
    }
    if (data.containsKey('paid_date')) {
      context.handle(
        _paidDateMeta,
        paidDate.isAcceptableOrUnknown(data['paid_date']!, _paidDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('reminder_sent')) {
      context.handle(
        _reminderSentMeta,
        reminderSent.isAcceptableOrUnknown(
          data['reminder_sent']!,
          _reminderSentMeta,
        ),
      );
    }
    if (data.containsKey('last_reminder_at')) {
      context.handle(
        _lastReminderAtMeta,
        lastReminderAt.isAcceptableOrUnknown(
          data['last_reminder_at']!,
          _lastReminderAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InstallmentPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstallmentPayment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}plan_id'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      amountDue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_due'],
      )!,
      amountPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_paid'],
      )!,
      paidDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reminderSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_sent'],
      )!,
      lastReminderAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reminder_at'],
      ),
    );
  }

  @override
  $InstallmentPaymentsTable createAlias(String alias) {
    return $InstallmentPaymentsTable(attachedDatabase, alias);
  }
}

class InstallmentPayment extends DataClass
    implements Insertable<InstallmentPayment> {
  final int id;
  final int planId;
  final DateTime dueDate;
  final double amountDue;
  final double amountPaid;
  final DateTime? paidDate;
  final String status;
  final bool reminderSent;
  final DateTime? lastReminderAt;
  const InstallmentPayment({
    required this.id,
    required this.planId,
    required this.dueDate,
    required this.amountDue,
    required this.amountPaid,
    this.paidDate,
    required this.status,
    required this.reminderSent,
    this.lastReminderAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_id'] = Variable<int>(planId);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['amount_due'] = Variable<double>(amountDue);
    map['amount_paid'] = Variable<double>(amountPaid);
    if (!nullToAbsent || paidDate != null) {
      map['paid_date'] = Variable<DateTime>(paidDate);
    }
    map['status'] = Variable<String>(status);
    map['reminder_sent'] = Variable<bool>(reminderSent);
    if (!nullToAbsent || lastReminderAt != null) {
      map['last_reminder_at'] = Variable<DateTime>(lastReminderAt);
    }
    return map;
  }

  InstallmentPaymentsCompanion toCompanion(bool nullToAbsent) {
    return InstallmentPaymentsCompanion(
      id: Value(id),
      planId: Value(planId),
      dueDate: Value(dueDate),
      amountDue: Value(amountDue),
      amountPaid: Value(amountPaid),
      paidDate: paidDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paidDate),
      status: Value(status),
      reminderSent: Value(reminderSent),
      lastReminderAt: lastReminderAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReminderAt),
    );
  }

  factory InstallmentPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstallmentPayment(
      id: serializer.fromJson<int>(json['id']),
      planId: serializer.fromJson<int>(json['planId']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      amountDue: serializer.fromJson<double>(json['amountDue']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      paidDate: serializer.fromJson<DateTime?>(json['paidDate']),
      status: serializer.fromJson<String>(json['status']),
      reminderSent: serializer.fromJson<bool>(json['reminderSent']),
      lastReminderAt: serializer.fromJson<DateTime?>(json['lastReminderAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planId': serializer.toJson<int>(planId),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'amountDue': serializer.toJson<double>(amountDue),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'paidDate': serializer.toJson<DateTime?>(paidDate),
      'status': serializer.toJson<String>(status),
      'reminderSent': serializer.toJson<bool>(reminderSent),
      'lastReminderAt': serializer.toJson<DateTime?>(lastReminderAt),
    };
  }

  InstallmentPayment copyWith({
    int? id,
    int? planId,
    DateTime? dueDate,
    double? amountDue,
    double? amountPaid,
    Value<DateTime?> paidDate = const Value.absent(),
    String? status,
    bool? reminderSent,
    Value<DateTime?> lastReminderAt = const Value.absent(),
  }) => InstallmentPayment(
    id: id ?? this.id,
    planId: planId ?? this.planId,
    dueDate: dueDate ?? this.dueDate,
    amountDue: amountDue ?? this.amountDue,
    amountPaid: amountPaid ?? this.amountPaid,
    paidDate: paidDate.present ? paidDate.value : this.paidDate,
    status: status ?? this.status,
    reminderSent: reminderSent ?? this.reminderSent,
    lastReminderAt: lastReminderAt.present
        ? lastReminderAt.value
        : this.lastReminderAt,
  );
  InstallmentPayment copyWithCompanion(InstallmentPaymentsCompanion data) {
    return InstallmentPayment(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      amountDue: data.amountDue.present ? data.amountDue.value : this.amountDue,
      amountPaid: data.amountPaid.present
          ? data.amountPaid.value
          : this.amountPaid,
      paidDate: data.paidDate.present ? data.paidDate.value : this.paidDate,
      status: data.status.present ? data.status.value : this.status,
      reminderSent: data.reminderSent.present
          ? data.reminderSent.value
          : this.reminderSent,
      lastReminderAt: data.lastReminderAt.present
          ? data.lastReminderAt.value
          : this.lastReminderAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InstallmentPayment(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('paidDate: $paidDate, ')
          ..write('status: $status, ')
          ..write('reminderSent: $reminderSent, ')
          ..write('lastReminderAt: $lastReminderAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planId,
    dueDate,
    amountDue,
    amountPaid,
    paidDate,
    status,
    reminderSent,
    lastReminderAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstallmentPayment &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.dueDate == this.dueDate &&
          other.amountDue == this.amountDue &&
          other.amountPaid == this.amountPaid &&
          other.paidDate == this.paidDate &&
          other.status == this.status &&
          other.reminderSent == this.reminderSent &&
          other.lastReminderAt == this.lastReminderAt);
}

class InstallmentPaymentsCompanion extends UpdateCompanion<InstallmentPayment> {
  final Value<int> id;
  final Value<int> planId;
  final Value<DateTime> dueDate;
  final Value<double> amountDue;
  final Value<double> amountPaid;
  final Value<DateTime?> paidDate;
  final Value<String> status;
  final Value<bool> reminderSent;
  final Value<DateTime?> lastReminderAt;
  const InstallmentPaymentsCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.paidDate = const Value.absent(),
    this.status = const Value.absent(),
    this.reminderSent = const Value.absent(),
    this.lastReminderAt = const Value.absent(),
  });
  InstallmentPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int planId,
    required DateTime dueDate,
    required double amountDue,
    this.amountPaid = const Value.absent(),
    this.paidDate = const Value.absent(),
    this.status = const Value.absent(),
    this.reminderSent = const Value.absent(),
    this.lastReminderAt = const Value.absent(),
  }) : planId = Value(planId),
       dueDate = Value(dueDate),
       amountDue = Value(amountDue);
  static Insertable<InstallmentPayment> custom({
    Expression<int>? id,
    Expression<int>? planId,
    Expression<DateTime>? dueDate,
    Expression<double>? amountDue,
    Expression<double>? amountPaid,
    Expression<DateTime>? paidDate,
    Expression<String>? status,
    Expression<bool>? reminderSent,
    Expression<DateTime>? lastReminderAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (dueDate != null) 'due_date': dueDate,
      if (amountDue != null) 'amount_due': amountDue,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (paidDate != null) 'paid_date': paidDate,
      if (status != null) 'status': status,
      if (reminderSent != null) 'reminder_sent': reminderSent,
      if (lastReminderAt != null) 'last_reminder_at': lastReminderAt,
    });
  }

  InstallmentPaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? planId,
    Value<DateTime>? dueDate,
    Value<double>? amountDue,
    Value<double>? amountPaid,
    Value<DateTime?>? paidDate,
    Value<String>? status,
    Value<bool>? reminderSent,
    Value<DateTime?>? lastReminderAt,
  }) {
    return InstallmentPaymentsCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      dueDate: dueDate ?? this.dueDate,
      amountDue: amountDue ?? this.amountDue,
      amountPaid: amountPaid ?? this.amountPaid,
      paidDate: paidDate ?? this.paidDate,
      status: status ?? this.status,
      reminderSent: reminderSent ?? this.reminderSent,
      lastReminderAt: lastReminderAt ?? this.lastReminderAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<int>(planId.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (amountDue.present) {
      map['amount_due'] = Variable<double>(amountDue.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (paidDate.present) {
      map['paid_date'] = Variable<DateTime>(paidDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reminderSent.present) {
      map['reminder_sent'] = Variable<bool>(reminderSent.value);
    }
    if (lastReminderAt.present) {
      map['last_reminder_at'] = Variable<DateTime>(lastReminderAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstallmentPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dueDate: $dueDate, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('paidDate: $paidDate, ')
          ..write('status: $status, ')
          ..write('reminderSent: $reminderSent, ')
          ..write('lastReminderAt: $lastReminderAt')
          ..write(')'))
        .toString();
  }
}

class $OrderPaymentsTable extends OrderPayments
    with TableInfo<$OrderPaymentsTable, OrderPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
    'paid_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedByMeta = const VerificationMeta(
    'receivedBy',
  );
  @override
  late final GeneratedColumn<int> receivedBy = GeneratedColumn<int>(
    'received_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES users(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    amount,
    method,
    paidAt,
    reference,
    receivedBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('paid_at')) {
      context.handle(
        _paidAtMeta,
        paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('received_by')) {
      context.handle(
        _receivedByMeta,
        receivedBy.isAcceptableOrUnknown(data['received_by']!, _receivedByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderPayment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      paidAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_at'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      receivedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}received_by'],
      ),
    );
  }

  @override
  $OrderPaymentsTable createAlias(String alias) {
    return $OrderPaymentsTable(attachedDatabase, alias);
  }
}

class OrderPayment extends DataClass implements Insertable<OrderPayment> {
  final int id;
  final int orderId;
  final double amount;
  final String method;
  final DateTime paidAt;
  final String? reference;
  final int? receivedBy;
  const OrderPayment({
    required this.id,
    required this.orderId,
    required this.amount,
    required this.method,
    required this.paidAt,
    this.reference,
    this.receivedBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['amount'] = Variable<double>(amount);
    map['method'] = Variable<String>(method);
    map['paid_at'] = Variable<DateTime>(paidAt);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || receivedBy != null) {
      map['received_by'] = Variable<int>(receivedBy);
    }
    return map;
  }

  OrderPaymentsCompanion toCompanion(bool nullToAbsent) {
    return OrderPaymentsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      amount: Value(amount),
      method: Value(method),
      paidAt: Value(paidAt),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      receivedBy: receivedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedBy),
    );
  }

  factory OrderPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderPayment(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      amount: serializer.fromJson<double>(json['amount']),
      method: serializer.fromJson<String>(json['method']),
      paidAt: serializer.fromJson<DateTime>(json['paidAt']),
      reference: serializer.fromJson<String?>(json['reference']),
      receivedBy: serializer.fromJson<int?>(json['receivedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'amount': serializer.toJson<double>(amount),
      'method': serializer.toJson<String>(method),
      'paidAt': serializer.toJson<DateTime>(paidAt),
      'reference': serializer.toJson<String?>(reference),
      'receivedBy': serializer.toJson<int?>(receivedBy),
    };
  }

  OrderPayment copyWith({
    int? id,
    int? orderId,
    double? amount,
    String? method,
    DateTime? paidAt,
    Value<String?> reference = const Value.absent(),
    Value<int?> receivedBy = const Value.absent(),
  }) => OrderPayment(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    amount: amount ?? this.amount,
    method: method ?? this.method,
    paidAt: paidAt ?? this.paidAt,
    reference: reference.present ? reference.value : this.reference,
    receivedBy: receivedBy.present ? receivedBy.value : this.receivedBy,
  );
  OrderPayment copyWithCompanion(OrderPaymentsCompanion data) {
    return OrderPayment(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      amount: data.amount.present ? data.amount.value : this.amount,
      method: data.method.present ? data.method.value : this.method,
      paidAt: data.paidAt.present ? data.paidAt.value : this.paidAt,
      reference: data.reference.present ? data.reference.value : this.reference,
      receivedBy: data.receivedBy.present
          ? data.receivedBy.value
          : this.receivedBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderPayment(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('paidAt: $paidAt, ')
          ..write('reference: $reference, ')
          ..write('receivedBy: $receivedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderId, amount, method, paidAt, reference, receivedBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderPayment &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.amount == this.amount &&
          other.method == this.method &&
          other.paidAt == this.paidAt &&
          other.reference == this.reference &&
          other.receivedBy == this.receivedBy);
}

class OrderPaymentsCompanion extends UpdateCompanion<OrderPayment> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<double> amount;
  final Value<String> method;
  final Value<DateTime> paidAt;
  final Value<String?> reference;
  final Value<int?> receivedBy;
  const OrderPaymentsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.amount = const Value.absent(),
    this.method = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.reference = const Value.absent(),
    this.receivedBy = const Value.absent(),
  });
  OrderPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required double amount,
    required String method,
    this.paidAt = const Value.absent(),
    this.reference = const Value.absent(),
    this.receivedBy = const Value.absent(),
  }) : orderId = Value(orderId),
       amount = Value(amount),
       method = Value(method);
  static Insertable<OrderPayment> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<double>? amount,
    Expression<String>? method,
    Expression<DateTime>? paidAt,
    Expression<String>? reference,
    Expression<int>? receivedBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (amount != null) 'amount': amount,
      if (method != null) 'method': method,
      if (paidAt != null) 'paid_at': paidAt,
      if (reference != null) 'reference': reference,
      if (receivedBy != null) 'received_by': receivedBy,
    });
  }

  OrderPaymentsCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<double>? amount,
    Value<String>? method,
    Value<DateTime>? paidAt,
    Value<String?>? reference,
    Value<int?>? receivedBy,
  }) {
    return OrderPaymentsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      amount: amount ?? this.amount,
      method: method ?? this.method,
      paidAt: paidAt ?? this.paidAt,
      reference: reference ?? this.reference,
      receivedBy: receivedBy ?? this.receivedBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (receivedBy.present) {
      map['received_by'] = Variable<int>(receivedBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('paidAt: $paidAt, ')
          ..write('reference: $reference, ')
          ..write('receivedBy: $receivedBy')
          ..write(')'))
        .toString();
  }
}

class $OrderDiscountsTable extends OrderDiscounts
    with TableInfo<$OrderDiscountsTable, OrderDiscount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderDiscountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _discountTypeMeta = const VerificationMeta(
    'discountType',
  );
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
    'discount_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    discountType,
    value,
    reason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_discounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderDiscount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
        _discountTypeMeta,
        discountType.isAcceptableOrUnknown(
          data['discount_type']!,
          _discountTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderDiscount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderDiscount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      discountType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discount_type'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
    );
  }

  @override
  $OrderDiscountsTable createAlias(String alias) {
    return $OrderDiscountsTable(attachedDatabase, alias);
  }
}

class OrderDiscount extends DataClass implements Insertable<OrderDiscount> {
  final int id;
  final int orderId;
  final String discountType;
  final double value;
  final String? reason;
  const OrderDiscount({
    required this.id,
    required this.orderId,
    required this.discountType,
    required this.value,
    this.reason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['discount_type'] = Variable<String>(discountType);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    return map;
  }

  OrderDiscountsCompanion toCompanion(bool nullToAbsent) {
    return OrderDiscountsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      discountType: Value(discountType),
      value: Value(value),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
    );
  }

  factory OrderDiscount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderDiscount(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      discountType: serializer.fromJson<String>(json['discountType']),
      value: serializer.fromJson<double>(json['value']),
      reason: serializer.fromJson<String?>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'discountType': serializer.toJson<String>(discountType),
      'value': serializer.toJson<double>(value),
      'reason': serializer.toJson<String?>(reason),
    };
  }

  OrderDiscount copyWith({
    int? id,
    int? orderId,
    String? discountType,
    double? value,
    Value<String?> reason = const Value.absent(),
  }) => OrderDiscount(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    discountType: discountType ?? this.discountType,
    value: value ?? this.value,
    reason: reason.present ? reason.value : this.reason,
  );
  OrderDiscount copyWithCompanion(OrderDiscountsCompanion data) {
    return OrderDiscount(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      value: data.value.present ? data.value.value : this.value,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderDiscount(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('discountType: $discountType, ')
          ..write('value: $value, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderId, discountType, value, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderDiscount &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.discountType == this.discountType &&
          other.value == this.value &&
          other.reason == this.reason);
}

class OrderDiscountsCompanion extends UpdateCompanion<OrderDiscount> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<String> discountType;
  final Value<double> value;
  final Value<String?> reason;
  const OrderDiscountsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.discountType = const Value.absent(),
    this.value = const Value.absent(),
    this.reason = const Value.absent(),
  });
  OrderDiscountsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required String discountType,
    required double value,
    this.reason = const Value.absent(),
  }) : orderId = Value(orderId),
       discountType = Value(discountType),
       value = Value(value);
  static Insertable<OrderDiscount> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<String>? discountType,
    Expression<double>? value,
    Expression<String>? reason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (discountType != null) 'discount_type': discountType,
      if (value != null) 'value': value,
      if (reason != null) 'reason': reason,
    });
  }

  OrderDiscountsCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<String>? discountType,
    Value<double>? value,
    Value<String?>? reason,
  }) {
    return OrderDiscountsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      discountType: discountType ?? this.discountType,
      value: value ?? this.value,
      reason: reason ?? this.reason,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderDiscountsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('discountType: $discountType, ')
          ..write('value: $value, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }
}

class $OrderLogsTable extends OrderLogs
    with TableInfo<$OrderLogsTable, OrderLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES orders(id)',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _changedByMeta = const VerificationMeta(
    'changedBy',
  );
  @override
  late final GeneratedColumn<int> changedBy = GeneratedColumn<int>(
    'changed_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES users(id)',
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    status,
    comment,
    changedBy,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('changed_by')) {
      context.handle(
        _changedByMeta,
        changedBy.isAcceptableOrUnknown(data['changed_by']!, _changedByMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      changedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}changed_by'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $OrderLogsTable createAlias(String alias) {
    return $OrderLogsTable(attachedDatabase, alias);
  }
}

class OrderLog extends DataClass implements Insertable<OrderLog> {
  final int id;
  final int orderId;
  final String status;
  final String? comment;
  final int? changedBy;
  final DateTime timestamp;
  const OrderLog({
    required this.id,
    required this.orderId,
    required this.status,
    this.comment,
    this.changedBy,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || changedBy != null) {
      map['changed_by'] = Variable<int>(changedBy);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  OrderLogsCompanion toCompanion(bool nullToAbsent) {
    return OrderLogsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      status: Value(status),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      changedBy: changedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(changedBy),
      timestamp: Value(timestamp),
    );
  }

  factory OrderLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderLog(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      status: serializer.fromJson<String>(json['status']),
      comment: serializer.fromJson<String?>(json['comment']),
      changedBy: serializer.fromJson<int?>(json['changedBy']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'status': serializer.toJson<String>(status),
      'comment': serializer.toJson<String?>(comment),
      'changedBy': serializer.toJson<int?>(changedBy),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  OrderLog copyWith({
    int? id,
    int? orderId,
    String? status,
    Value<String?> comment = const Value.absent(),
    Value<int?> changedBy = const Value.absent(),
    DateTime? timestamp,
  }) => OrderLog(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    status: status ?? this.status,
    comment: comment.present ? comment.value : this.comment,
    changedBy: changedBy.present ? changedBy.value : this.changedBy,
    timestamp: timestamp ?? this.timestamp,
  );
  OrderLog copyWithCompanion(OrderLogsCompanion data) {
    return OrderLog(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      status: data.status.present ? data.status.value : this.status,
      comment: data.comment.present ? data.comment.value : this.comment,
      changedBy: data.changedBy.present ? data.changedBy.value : this.changedBy,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderLog(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('status: $status, ')
          ..write('comment: $comment, ')
          ..write('changedBy: $changedBy, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderId, status, comment, changedBy, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderLog &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.status == this.status &&
          other.comment == this.comment &&
          other.changedBy == this.changedBy &&
          other.timestamp == this.timestamp);
}

class OrderLogsCompanion extends UpdateCompanion<OrderLog> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<String> status;
  final Value<String?> comment;
  final Value<int?> changedBy;
  final Value<DateTime> timestamp;
  const OrderLogsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.status = const Value.absent(),
    this.comment = const Value.absent(),
    this.changedBy = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  OrderLogsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required String status,
    this.comment = const Value.absent(),
    this.changedBy = const Value.absent(),
    this.timestamp = const Value.absent(),
  }) : orderId = Value(orderId),
       status = Value(status);
  static Insertable<OrderLog> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<String>? status,
    Expression<String>? comment,
    Expression<int>? changedBy,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (status != null) 'status': status,
      if (comment != null) 'comment': comment,
      if (changedBy != null) 'changed_by': changedBy,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  OrderLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? orderId,
    Value<String>? status,
    Value<String?>? comment,
    Value<int?>? changedBy,
    Value<DateTime>? timestamp,
  }) {
    return OrderLogsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      status: status ?? this.status,
      comment: comment ?? this.comment,
      changedBy: changedBy ?? this.changedBy,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (changedBy.present) {
      map['changed_by'] = Variable<int>(changedBy.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderLogsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('status: $status, ')
          ..write('comment: $comment, ')
          ..write('changedBy: $changedBy, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $StoresTable stores = $StoresTable(this);
  late final $StoreSettingsTable storeSettings = $StoreSettingsTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderItemsTable orderItems = $OrderItemsTable(this);
  late final $CreditPlansTable creditPlans = $CreditPlansTable(this);
  late final $InstallmentPaymentsTable installmentPayments =
      $InstallmentPaymentsTable(this);
  late final $OrderPaymentsTable orderPayments = $OrderPaymentsTable(this);
  late final $OrderDiscountsTable orderDiscounts = $OrderDiscountsTable(this);
  late final $OrderLogsTable orderLogs = $OrderLogsTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final ProductDao productDao = ProductDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    products,
    stores,
    storeSettings,
    customers,
    orders,
    orderItems,
    creditPlans,
    installmentPayments,
    orderPayments,
    orderDiscounts,
    orderLogs,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String password,
      Value<String> role,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> password,
      Value<String> role,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                password: password,
                role: role,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String password,
                Value<String> role = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                password: password,
                role: role,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String name,
      required double retailPrice,
      required double wholesalePrice,
      Value<double?> retailPriceWithTax,
      Value<double?> wholesalePriceWithTax,
      Value<String?> description,
      Value<DateTime> createdAt,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> retailPrice,
      Value<double> wholesalePrice,
      Value<double?> retailPriceWithTax,
      Value<double?> wholesalePriceWithTax,
      Value<String?> description,
      Value<DateTime> createdAt,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get retailPrice => $composableBuilder(
    column: $table.retailPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wholesalePrice => $composableBuilder(
    column: $table.wholesalePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get retailPriceWithTax => $composableBuilder(
    column: $table.retailPriceWithTax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wholesalePriceWithTax => $composableBuilder(
    column: $table.wholesalePriceWithTax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get retailPrice => $composableBuilder(
    column: $table.retailPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wholesalePrice => $composableBuilder(
    column: $table.wholesalePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get retailPriceWithTax => $composableBuilder(
    column: $table.retailPriceWithTax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wholesalePriceWithTax => $composableBuilder(
    column: $table.wholesalePriceWithTax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get retailPrice => $composableBuilder(
    column: $table.retailPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get wholesalePrice => $composableBuilder(
    column: $table.wholesalePrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get retailPriceWithTax => $composableBuilder(
    column: $table.retailPriceWithTax,
    builder: (column) => column,
  );

  GeneratedColumn<double> get wholesalePriceWithTax => $composableBuilder(
    column: $table.wholesalePriceWithTax,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> retailPrice = const Value.absent(),
                Value<double> wholesalePrice = const Value.absent(),
                Value<double?> retailPriceWithTax = const Value.absent(),
                Value<double?> wholesalePriceWithTax = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                name: name,
                retailPrice: retailPrice,
                wholesalePrice: wholesalePrice,
                retailPriceWithTax: retailPriceWithTax,
                wholesalePriceWithTax: wholesalePriceWithTax,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double retailPrice,
                required double wholesalePrice,
                Value<double?> retailPriceWithTax = const Value.absent(),
                Value<double?> wholesalePriceWithTax = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                name: name,
                retailPrice: retailPrice,
                wholesalePrice: wholesalePrice,
                retailPriceWithTax: retailPriceWithTax,
                wholesalePriceWithTax: wholesalePriceWithTax,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$StoresTableCreateCompanionBuilder =
    StoresCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> address,
      Value<String?> phone,
    });
typedef $$StoresTableUpdateCompanionBuilder =
    StoresCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> address,
      Value<String?> phone,
    });

final class $$StoresTableReferences
    extends BaseReferences<_$AppDatabase, $StoresTable, Store> {
  $$StoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StoreSettingsTable, List<StoreSetting>>
  _storeSettingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.storeSettings,
    aliasName: $_aliasNameGenerator(db.stores.id, db.storeSettings.storeId),
  );

  $$StoreSettingsTableProcessedTableManager get storeSettingsRefs {
    final manager = $$StoreSettingsTableTableManager(
      $_db,
      $_db.storeSettings,
    ).filter((f) => f.storeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_storeSettingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StoresTableFilterComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> storeSettingsRefs(
    Expression<bool> Function($$StoreSettingsTableFilterComposer f) f,
  ) {
    final $$StoreSettingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.storeSettings,
      getReferencedColumn: (t) => t.storeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoreSettingsTableFilterComposer(
            $db: $db,
            $table: $db.storeSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StoresTableOrderingComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  Expression<T> storeSettingsRefs<T extends Object>(
    Expression<T> Function($$StoreSettingsTableAnnotationComposer a) f,
  ) {
    final $$StoreSettingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.storeSettings,
      getReferencedColumn: (t) => t.storeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoreSettingsTableAnnotationComposer(
            $db: $db,
            $table: $db.storeSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoresTable,
          Store,
          $$StoresTableFilterComposer,
          $$StoresTableOrderingComposer,
          $$StoresTableAnnotationComposer,
          $$StoresTableCreateCompanionBuilder,
          $$StoresTableUpdateCompanionBuilder,
          (Store, $$StoresTableReferences),
          Store,
          PrefetchHooks Function({bool storeSettingsRefs})
        > {
  $$StoresTableTableManager(_$AppDatabase db, $StoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
              }) => StoresCompanion(
                id: id,
                name: name,
                address: address,
                phone: phone,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
              }) => StoresCompanion.insert(
                id: id,
                name: name,
                address: address,
                phone: phone,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StoresTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({storeSettingsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (storeSettingsRefs) db.storeSettings,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (storeSettingsRefs)
                    await $_getPrefetchedData<
                      Store,
                      $StoresTable,
                      StoreSetting
                    >(
                      currentTable: table,
                      referencedTable: $$StoresTableReferences
                          ._storeSettingsRefsTable(db),
                      managerFromTypedResult: (p0) => $$StoresTableReferences(
                        db,
                        table,
                        p0,
                      ).storeSettingsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.storeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoresTable,
      Store,
      $$StoresTableFilterComposer,
      $$StoresTableOrderingComposer,
      $$StoresTableAnnotationComposer,
      $$StoresTableCreateCompanionBuilder,
      $$StoresTableUpdateCompanionBuilder,
      (Store, $$StoresTableReferences),
      Store,
      PrefetchHooks Function({bool storeSettingsRefs})
    >;
typedef $$StoreSettingsTableCreateCompanionBuilder =
    StoreSettingsCompanion Function({
      Value<int> id,
      required int storeId,
      required String key,
      required String value,
    });
typedef $$StoreSettingsTableUpdateCompanionBuilder =
    StoreSettingsCompanion Function({
      Value<int> id,
      Value<int> storeId,
      Value<String> key,
      Value<String> value,
    });

final class $$StoreSettingsTableReferences
    extends BaseReferences<_$AppDatabase, $StoreSettingsTable, StoreSetting> {
  $$StoreSettingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoresTable _storeIdTable(_$AppDatabase db) => db.stores.createAlias(
    $_aliasNameGenerator(db.storeSettings.storeId, db.stores.id),
  );

  $$StoresTableProcessedTableManager get storeId {
    final $_column = $_itemColumn<int>('store_id')!;

    final manager = $$StoresTableTableManager(
      $_db,
      $_db.stores,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_storeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StoreSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$StoresTableFilterComposer get storeId {
    final $$StoresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storeId,
      referencedTable: $db.stores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoresTableFilterComposer(
            $db: $db,
            $table: $db.stores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StoreSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$StoresTableOrderingComposer get storeId {
    final $$StoresTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storeId,
      referencedTable: $db.stores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoresTableOrderingComposer(
            $db: $db,
            $table: $db.stores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StoreSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoreSettingsTable> {
  $$StoreSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$StoresTableAnnotationComposer get storeId {
    final $$StoresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.storeId,
      referencedTable: $db.stores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoresTableAnnotationComposer(
            $db: $db,
            $table: $db.stores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StoreSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoreSettingsTable,
          StoreSetting,
          $$StoreSettingsTableFilterComposer,
          $$StoreSettingsTableOrderingComposer,
          $$StoreSettingsTableAnnotationComposer,
          $$StoreSettingsTableCreateCompanionBuilder,
          $$StoreSettingsTableUpdateCompanionBuilder,
          (StoreSetting, $$StoreSettingsTableReferences),
          StoreSetting,
          PrefetchHooks Function({bool storeId})
        > {
  $$StoreSettingsTableTableManager(_$AppDatabase db, $StoreSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoreSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoreSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoreSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> storeId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
              }) => StoreSettingsCompanion(
                id: id,
                storeId: storeId,
                key: key,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int storeId,
                required String key,
                required String value,
              }) => StoreSettingsCompanion.insert(
                id: id,
                storeId: storeId,
                key: key,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StoreSettingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({storeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (storeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.storeId,
                                referencedTable: $$StoreSettingsTableReferences
                                    ._storeIdTable(db),
                                referencedColumn: $$StoreSettingsTableReferences
                                    ._storeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StoreSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoreSettingsTable,
      StoreSetting,
      $$StoreSettingsTableFilterComposer,
      $$StoreSettingsTableOrderingComposer,
      $$StoreSettingsTableAnnotationComposer,
      $$StoreSettingsTableCreateCompanionBuilder,
      $$StoreSettingsTableUpdateCompanionBuilder,
      (StoreSetting, $$StoreSettingsTableReferences),
      StoreSetting,
      PrefetchHooks Function({bool storeId})
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> email,
      required int storeId,
      Value<String> customerType,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> email,
      Value<int> storeId,
      Value<String> customerType,
    });

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get storeId =>
      $composableBuilder(column: $table.storeId, builder: (column) => column);

  GeneratedColumn<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => column,
  );
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
          Customer,
          PrefetchHooks Function()
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int> storeId = const Value.absent(),
                Value<String> customerType = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                name: name,
                phone: phone,
                address: address,
                email: email,
                storeId: storeId,
                customerType: customerType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> email = const Value.absent(),
                required int storeId,
                Value<String> customerType = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                address: address,
                email: email,
                storeId: storeId,
                customerType: customerType,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
      Customer,
      PrefetchHooks Function()
    >;
typedef $$OrdersTableCreateCompanionBuilder =
    OrdersCompanion Function({
      Value<int> id,
      required int customerId,
      Value<DateTime> orderDate,
      required double totalAmount,
      Value<String> orderStatus,
      Value<String?> paymentMethod,
      Value<String> paymentStatus,
      Value<String?> orderType,
      Value<bool> deliveryRequired,
      required int storeId,
      required String phoneNumber,
      Value<int?> createdBy,
    });
typedef $$OrdersTableUpdateCompanionBuilder =
    OrdersCompanion Function({
      Value<int> id,
      Value<int> customerId,
      Value<DateTime> orderDate,
      Value<double> totalAmount,
      Value<String> orderStatus,
      Value<String?> paymentMethod,
      Value<String> paymentStatus,
      Value<String?> orderType,
      Value<bool> deliveryRequired,
      Value<int> storeId,
      Value<String> phoneNumber,
      Value<int?> createdBy,
    });

final class $$OrdersTableReferences
    extends BaseReferences<_$AppDatabase, $OrdersTable, Order> {
  $$OrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrderItemsTable, List<OrderItem>>
  _orderItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderItems,
    aliasName: $_aliasNameGenerator(db.orders.id, db.orderItems.orderId),
  );

  $$OrderItemsTableProcessedTableManager get orderItemsRefs {
    final manager = $$OrderItemsTableTableManager(
      $_db,
      $_db.orderItems,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrderPaymentsTable, List<OrderPayment>>
  _orderPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderPayments,
    aliasName: $_aliasNameGenerator(db.orders.id, db.orderPayments.orderId),
  );

  $$OrderPaymentsTableProcessedTableManager get orderPaymentsRefs {
    final manager = $$OrderPaymentsTableTableManager(
      $_db,
      $_db.orderPayments,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderPaymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrderDiscountsTable, List<OrderDiscount>>
  _orderDiscountsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderDiscounts,
    aliasName: $_aliasNameGenerator(db.orders.id, db.orderDiscounts.orderId),
  );

  $$OrderDiscountsTableProcessedTableManager get orderDiscountsRefs {
    final manager = $$OrderDiscountsTableTableManager(
      $_db,
      $_db.orderDiscounts,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderDiscountsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrderLogsTable, List<OrderLog>>
  _orderLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.orderLogs,
    aliasName: $_aliasNameGenerator(db.orders.id, db.orderLogs.orderId),
  );

  $$OrderLogsTableProcessedTableManager get orderLogsRefs {
    final manager = $$OrderLogsTableTableManager(
      $_db,
      $_db.orderLogs,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrdersTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deliveryRequired => $composableBuilder(
    column: $table.deliveryRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> orderItemsRefs(
    Expression<bool> Function($$OrderItemsTableFilterComposer f) f,
  ) {
    final $$OrderItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItems,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableFilterComposer(
            $db: $db,
            $table: $db.orderItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> orderPaymentsRefs(
    Expression<bool> Function($$OrderPaymentsTableFilterComposer f) f,
  ) {
    final $$OrderPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderPayments,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.orderPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> orderDiscountsRefs(
    Expression<bool> Function($$OrderDiscountsTableFilterComposer f) f,
  ) {
    final $$OrderDiscountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderDiscounts,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderDiscountsTableFilterComposer(
            $db: $db,
            $table: $db.orderDiscounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> orderLogsRefs(
    Expression<bool> Function($$OrderLogsTableFilterComposer f) f,
  ) {
    final $$OrderLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderLogs,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderLogsTableFilterComposer(
            $db: $db,
            $table: $db.orderLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderType => $composableBuilder(
    column: $table.orderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deliveryRequired => $composableBuilder(
    column: $table.deliveryRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get orderDate =>
      $composableBuilder(column: $table.orderDate, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumn<bool> get deliveryRequired => $composableBuilder(
    column: $table.deliveryRequired,
    builder: (column) => column,
  );

  GeneratedColumn<int> get storeId =>
      $composableBuilder(column: $table.storeId, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  Expression<T> orderItemsRefs<T extends Object>(
    Expression<T> Function($$OrderItemsTableAnnotationComposer a) f,
  ) {
    final $$OrderItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderItems,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> orderPaymentsRefs<T extends Object>(
    Expression<T> Function($$OrderPaymentsTableAnnotationComposer a) f,
  ) {
    final $$OrderPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderPayments,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> orderDiscountsRefs<T extends Object>(
    Expression<T> Function($$OrderDiscountsTableAnnotationComposer a) f,
  ) {
    final $$OrderDiscountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderDiscounts,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderDiscountsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderDiscounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> orderLogsRefs<T extends Object>(
    Expression<T> Function($$OrderLogsTableAnnotationComposer a) f,
  ) {
    final $$OrderLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderLogs,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdersTable,
          Order,
          $$OrdersTableFilterComposer,
          $$OrdersTableOrderingComposer,
          $$OrdersTableAnnotationComposer,
          $$OrdersTableCreateCompanionBuilder,
          $$OrdersTableUpdateCompanionBuilder,
          (Order, $$OrdersTableReferences),
          Order,
          PrefetchHooks Function({
            bool orderItemsRefs,
            bool orderPaymentsRefs,
            bool orderDiscountsRefs,
            bool orderLogsRefs,
          })
        > {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> customerId = const Value.absent(),
                Value<DateTime> orderDate = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<String> orderStatus = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> orderType = const Value.absent(),
                Value<bool> deliveryRequired = const Value.absent(),
                Value<int> storeId = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<int?> createdBy = const Value.absent(),
              }) => OrdersCompanion(
                id: id,
                customerId: customerId,
                orderDate: orderDate,
                totalAmount: totalAmount,
                orderStatus: orderStatus,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                orderType: orderType,
                deliveryRequired: deliveryRequired,
                storeId: storeId,
                phoneNumber: phoneNumber,
                createdBy: createdBy,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int customerId,
                Value<DateTime> orderDate = const Value.absent(),
                required double totalAmount,
                Value<String> orderStatus = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> orderType = const Value.absent(),
                Value<bool> deliveryRequired = const Value.absent(),
                required int storeId,
                required String phoneNumber,
                Value<int?> createdBy = const Value.absent(),
              }) => OrdersCompanion.insert(
                id: id,
                customerId: customerId,
                orderDate: orderDate,
                totalAmount: totalAmount,
                orderStatus: orderStatus,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                orderType: orderType,
                deliveryRequired: deliveryRequired,
                storeId: storeId,
                phoneNumber: phoneNumber,
                createdBy: createdBy,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$OrdersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                orderItemsRefs = false,
                orderPaymentsRefs = false,
                orderDiscountsRefs = false,
                orderLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (orderItemsRefs) db.orderItems,
                    if (orderPaymentsRefs) db.orderPayments,
                    if (orderDiscountsRefs) db.orderDiscounts,
                    if (orderLogsRefs) db.orderLogs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (orderItemsRefs)
                        await $_getPrefetchedData<
                          Order,
                          $OrdersTable,
                          OrderItem
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableReferences
                              ._orderItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).orderItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (orderPaymentsRefs)
                        await $_getPrefetchedData<
                          Order,
                          $OrdersTable,
                          OrderPayment
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableReferences
                              ._orderPaymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).orderPaymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (orderDiscountsRefs)
                        await $_getPrefetchedData<
                          Order,
                          $OrdersTable,
                          OrderDiscount
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableReferences
                              ._orderDiscountsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).orderDiscountsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (orderLogsRefs)
                        await $_getPrefetchedData<
                          Order,
                          $OrdersTable,
                          OrderLog
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableReferences
                              ._orderLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).orderLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdersTable,
      Order,
      $$OrdersTableFilterComposer,
      $$OrdersTableOrderingComposer,
      $$OrdersTableAnnotationComposer,
      $$OrdersTableCreateCompanionBuilder,
      $$OrdersTableUpdateCompanionBuilder,
      (Order, $$OrdersTableReferences),
      Order,
      PrefetchHooks Function({
        bool orderItemsRefs,
        bool orderPaymentsRefs,
        bool orderDiscountsRefs,
        bool orderLogsRefs,
      })
    >;
typedef $$OrderItemsTableCreateCompanionBuilder =
    OrderItemsCompanion Function({
      Value<int> id,
      required int orderId,
      required int productId,
      required int quantity,
      required double price,
      required double buyingPrice,
      required double taxAmount,
      required int storeId,
      Value<String> saleType,
    });
typedef $$OrderItemsTableUpdateCompanionBuilder =
    OrderItemsCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<int> productId,
      Value<int> quantity,
      Value<double> price,
      Value<double> buyingPrice,
      Value<double> taxAmount,
      Value<int> storeId,
      Value<String> saleType,
    });

final class $$OrderItemsTableReferences
    extends BaseReferences<_$AppDatabase, $OrderItemsTable, OrderItem> {
  $$OrderItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OrdersTable _orderIdTable(_$AppDatabase db) => db.orders.createAlias(
    $_aliasNameGenerator(db.orderItems.orderId, db.orders.id),
  );

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderItemsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get buyingPrice => $composableBuilder(
    column: $table.buyingPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleType => $composableBuilder(
    column: $table.saleType,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get buyingPrice => $composableBuilder(
    column: $table.buyingPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get storeId => $composableBuilder(
    column: $table.storeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleType => $composableBuilder(
    column: $table.saleType,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableOrderingComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get buyingPrice => $composableBuilder(
    column: $table.buyingPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get taxAmount =>
      $composableBuilder(column: $table.taxAmount, builder: (column) => column);

  GeneratedColumn<int> get storeId =>
      $composableBuilder(column: $table.storeId, builder: (column) => column);

  GeneratedColumn<String> get saleType =>
      $composableBuilder(column: $table.saleType, builder: (column) => column);

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderItemsTable,
          OrderItem,
          $$OrderItemsTableFilterComposer,
          $$OrderItemsTableOrderingComposer,
          $$OrderItemsTableAnnotationComposer,
          $$OrderItemsTableCreateCompanionBuilder,
          $$OrderItemsTableUpdateCompanionBuilder,
          (OrderItem, $$OrderItemsTableReferences),
          OrderItem,
          PrefetchHooks Function({bool orderId})
        > {
  $$OrderItemsTableTableManager(_$AppDatabase db, $OrderItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> buyingPrice = const Value.absent(),
                Value<double> taxAmount = const Value.absent(),
                Value<int> storeId = const Value.absent(),
                Value<String> saleType = const Value.absent(),
              }) => OrderItemsCompanion(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                price: price,
                buyingPrice: buyingPrice,
                taxAmount: taxAmount,
                storeId: storeId,
                saleType: saleType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required int productId,
                required int quantity,
                required double price,
                required double buyingPrice,
                required double taxAmount,
                required int storeId,
                Value<String> saleType = const Value.absent(),
              }) => OrderItemsCompanion.insert(
                id: id,
                orderId: orderId,
                productId: productId,
                quantity: quantity,
                price: price,
                buyingPrice: buyingPrice,
                taxAmount: taxAmount,
                storeId: storeId,
                saleType: saleType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable: $$OrderItemsTableReferences
                                    ._orderIdTable(db),
                                referencedColumn: $$OrderItemsTableReferences
                                    ._orderIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrderItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderItemsTable,
      OrderItem,
      $$OrderItemsTableFilterComposer,
      $$OrderItemsTableOrderingComposer,
      $$OrderItemsTableAnnotationComposer,
      $$OrderItemsTableCreateCompanionBuilder,
      $$OrderItemsTableUpdateCompanionBuilder,
      (OrderItem, $$OrderItemsTableReferences),
      OrderItem,
      PrefetchHooks Function({bool orderId})
    >;
typedef $$CreditPlansTableCreateCompanionBuilder =
    CreditPlansCompanion Function({
      Value<int> id,
      required int orderId,
      required DateTime startDate,
      required DateTime dueDate,
      Value<int> numberOfInstallments,
      required double installmentAmount,
      required double finalAmount,
      Value<double> totalPaid,
      Value<int> gracePeriodDays,
      Value<DateTime?> nextDueDate,
      Value<String> status,
      Value<String?> notes,
    });
typedef $$CreditPlansTableUpdateCompanionBuilder =
    CreditPlansCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<DateTime> startDate,
      Value<DateTime> dueDate,
      Value<int> numberOfInstallments,
      Value<double> installmentAmount,
      Value<double> finalAmount,
      Value<double> totalPaid,
      Value<int> gracePeriodDays,
      Value<DateTime?> nextDueDate,
      Value<String> status,
      Value<String?> notes,
    });

final class $$CreditPlansTableReferences
    extends BaseReferences<_$AppDatabase, $CreditPlansTable, CreditPlan> {
  $$CreditPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $InstallmentPaymentsTable,
    List<InstallmentPayment>
  >
  _installmentPaymentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.installmentPayments,
        aliasName: $_aliasNameGenerator(
          db.creditPlans.id,
          db.installmentPayments.planId,
        ),
      );

  $$InstallmentPaymentsTableProcessedTableManager get installmentPaymentsRefs {
    final manager = $$InstallmentPaymentsTableTableManager(
      $_db,
      $_db.installmentPayments,
    ).filter((f) => f.planId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _installmentPaymentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CreditPlansTableFilterComposer
    extends Composer<_$AppDatabase, $CreditPlansTable> {
  $$CreditPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get installmentAmount => $composableBuilder(
    column: $table.installmentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalAmount => $composableBuilder(
    column: $table.finalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPaid => $composableBuilder(
    column: $table.totalPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gracePeriodDays => $composableBuilder(
    column: $table.gracePeriodDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> installmentPaymentsRefs(
    Expression<bool> Function($$InstallmentPaymentsTableFilterComposer f) f,
  ) {
    final $$InstallmentPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.installmentPayments,
      getReferencedColumn: (t) => t.planId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InstallmentPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.installmentPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CreditPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditPlansTable> {
  $$CreditPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get installmentAmount => $composableBuilder(
    column: $table.installmentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalAmount => $composableBuilder(
    column: $table.finalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPaid => $composableBuilder(
    column: $table.totalPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gracePeriodDays => $composableBuilder(
    column: $table.gracePeriodDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreditPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditPlansTable> {
  $$CreditPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get numberOfInstallments => $composableBuilder(
    column: $table.numberOfInstallments,
    builder: (column) => column,
  );

  GeneratedColumn<double> get installmentAmount => $composableBuilder(
    column: $table.installmentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get finalAmount => $composableBuilder(
    column: $table.finalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalPaid =>
      $composableBuilder(column: $table.totalPaid, builder: (column) => column);

  GeneratedColumn<int> get gracePeriodDays => $composableBuilder(
    column: $table.gracePeriodDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> installmentPaymentsRefs<T extends Object>(
    Expression<T> Function($$InstallmentPaymentsTableAnnotationComposer a) f,
  ) {
    final $$InstallmentPaymentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.installmentPayments,
          getReferencedColumn: (t) => t.planId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InstallmentPaymentsTableAnnotationComposer(
                $db: $db,
                $table: $db.installmentPayments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CreditPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditPlansTable,
          CreditPlan,
          $$CreditPlansTableFilterComposer,
          $$CreditPlansTableOrderingComposer,
          $$CreditPlansTableAnnotationComposer,
          $$CreditPlansTableCreateCompanionBuilder,
          $$CreditPlansTableUpdateCompanionBuilder,
          (CreditPlan, $$CreditPlansTableReferences),
          CreditPlan,
          PrefetchHooks Function({bool installmentPaymentsRefs})
        > {
  $$CreditPlansTableTableManager(_$AppDatabase db, $CreditPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<int> numberOfInstallments = const Value.absent(),
                Value<double> installmentAmount = const Value.absent(),
                Value<double> finalAmount = const Value.absent(),
                Value<double> totalPaid = const Value.absent(),
                Value<int> gracePeriodDays = const Value.absent(),
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => CreditPlansCompanion(
                id: id,
                orderId: orderId,
                startDate: startDate,
                dueDate: dueDate,
                numberOfInstallments: numberOfInstallments,
                installmentAmount: installmentAmount,
                finalAmount: finalAmount,
                totalPaid: totalPaid,
                gracePeriodDays: gracePeriodDays,
                nextDueDate: nextDueDate,
                status: status,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required DateTime startDate,
                required DateTime dueDate,
                Value<int> numberOfInstallments = const Value.absent(),
                required double installmentAmount,
                required double finalAmount,
                Value<double> totalPaid = const Value.absent(),
                Value<int> gracePeriodDays = const Value.absent(),
                Value<DateTime?> nextDueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => CreditPlansCompanion.insert(
                id: id,
                orderId: orderId,
                startDate: startDate,
                dueDate: dueDate,
                numberOfInstallments: numberOfInstallments,
                installmentAmount: installmentAmount,
                finalAmount: finalAmount,
                totalPaid: totalPaid,
                gracePeriodDays: gracePeriodDays,
                nextDueDate: nextDueDate,
                status: status,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CreditPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({installmentPaymentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (installmentPaymentsRefs) db.installmentPayments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (installmentPaymentsRefs)
                    await $_getPrefetchedData<
                      CreditPlan,
                      $CreditPlansTable,
                      InstallmentPayment
                    >(
                      currentTable: table,
                      referencedTable: $$CreditPlansTableReferences
                          ._installmentPaymentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CreditPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).installmentPaymentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.planId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CreditPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditPlansTable,
      CreditPlan,
      $$CreditPlansTableFilterComposer,
      $$CreditPlansTableOrderingComposer,
      $$CreditPlansTableAnnotationComposer,
      $$CreditPlansTableCreateCompanionBuilder,
      $$CreditPlansTableUpdateCompanionBuilder,
      (CreditPlan, $$CreditPlansTableReferences),
      CreditPlan,
      PrefetchHooks Function({bool installmentPaymentsRefs})
    >;
typedef $$InstallmentPaymentsTableCreateCompanionBuilder =
    InstallmentPaymentsCompanion Function({
      Value<int> id,
      required int planId,
      required DateTime dueDate,
      required double amountDue,
      Value<double> amountPaid,
      Value<DateTime?> paidDate,
      Value<String> status,
      Value<bool> reminderSent,
      Value<DateTime?> lastReminderAt,
    });
typedef $$InstallmentPaymentsTableUpdateCompanionBuilder =
    InstallmentPaymentsCompanion Function({
      Value<int> id,
      Value<int> planId,
      Value<DateTime> dueDate,
      Value<double> amountDue,
      Value<double> amountPaid,
      Value<DateTime?> paidDate,
      Value<String> status,
      Value<bool> reminderSent,
      Value<DateTime?> lastReminderAt,
    });

final class $$InstallmentPaymentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InstallmentPaymentsTable,
          InstallmentPayment
        > {
  $$InstallmentPaymentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CreditPlansTable _planIdTable(_$AppDatabase db) =>
      db.creditPlans.createAlias(
        $_aliasNameGenerator(db.installmentPayments.planId, db.creditPlans.id),
      );

  $$CreditPlansTableProcessedTableManager get planId {
    final $_column = $_itemColumn<int>('plan_id')!;

    final manager = $$CreditPlansTableTableManager(
      $_db,
      $_db.creditPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InstallmentPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $InstallmentPaymentsTable> {
  $$InstallmentPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountDue => $composableBuilder(
    column: $table.amountDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidDate => $composableBuilder(
    column: $table.paidDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReminderAt => $composableBuilder(
    column: $table.lastReminderAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CreditPlansTableFilterComposer get planId {
    final $$CreditPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.creditPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditPlansTableFilterComposer(
            $db: $db,
            $table: $db.creditPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $InstallmentPaymentsTable> {
  $$InstallmentPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountDue => $composableBuilder(
    column: $table.amountDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidDate => $composableBuilder(
    column: $table.paidDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReminderAt => $composableBuilder(
    column: $table.lastReminderAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CreditPlansTableOrderingComposer get planId {
    final $$CreditPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.creditPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditPlansTableOrderingComposer(
            $db: $db,
            $table: $db.creditPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InstallmentPaymentsTable> {
  $$InstallmentPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get amountDue =>
      $composableBuilder(column: $table.amountDue, builder: (column) => column);

  GeneratedColumn<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get paidDate =>
      $composableBuilder(column: $table.paidDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get reminderSent => $composableBuilder(
    column: $table.reminderSent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReminderAt => $composableBuilder(
    column: $table.lastReminderAt,
    builder: (column) => column,
  );

  $$CreditPlansTableAnnotationComposer get planId {
    final $$CreditPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.creditPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CreditPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.creditPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InstallmentPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InstallmentPaymentsTable,
          InstallmentPayment,
          $$InstallmentPaymentsTableFilterComposer,
          $$InstallmentPaymentsTableOrderingComposer,
          $$InstallmentPaymentsTableAnnotationComposer,
          $$InstallmentPaymentsTableCreateCompanionBuilder,
          $$InstallmentPaymentsTableUpdateCompanionBuilder,
          (InstallmentPayment, $$InstallmentPaymentsTableReferences),
          InstallmentPayment,
          PrefetchHooks Function({bool planId})
        > {
  $$InstallmentPaymentsTableTableManager(
    _$AppDatabase db,
    $InstallmentPaymentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InstallmentPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InstallmentPaymentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InstallmentPaymentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> planId = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<double> amountDue = const Value.absent(),
                Value<double> amountPaid = const Value.absent(),
                Value<DateTime?> paidDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> reminderSent = const Value.absent(),
                Value<DateTime?> lastReminderAt = const Value.absent(),
              }) => InstallmentPaymentsCompanion(
                id: id,
                planId: planId,
                dueDate: dueDate,
                amountDue: amountDue,
                amountPaid: amountPaid,
                paidDate: paidDate,
                status: status,
                reminderSent: reminderSent,
                lastReminderAt: lastReminderAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int planId,
                required DateTime dueDate,
                required double amountDue,
                Value<double> amountPaid = const Value.absent(),
                Value<DateTime?> paidDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> reminderSent = const Value.absent(),
                Value<DateTime?> lastReminderAt = const Value.absent(),
              }) => InstallmentPaymentsCompanion.insert(
                id: id,
                planId: planId,
                dueDate: dueDate,
                amountDue: amountDue,
                amountPaid: amountPaid,
                paidDate: paidDate,
                status: status,
                reminderSent: reminderSent,
                lastReminderAt: lastReminderAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InstallmentPaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({planId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (planId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.planId,
                                referencedTable:
                                    $$InstallmentPaymentsTableReferences
                                        ._planIdTable(db),
                                referencedColumn:
                                    $$InstallmentPaymentsTableReferences
                                        ._planIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InstallmentPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InstallmentPaymentsTable,
      InstallmentPayment,
      $$InstallmentPaymentsTableFilterComposer,
      $$InstallmentPaymentsTableOrderingComposer,
      $$InstallmentPaymentsTableAnnotationComposer,
      $$InstallmentPaymentsTableCreateCompanionBuilder,
      $$InstallmentPaymentsTableUpdateCompanionBuilder,
      (InstallmentPayment, $$InstallmentPaymentsTableReferences),
      InstallmentPayment,
      PrefetchHooks Function({bool planId})
    >;
typedef $$OrderPaymentsTableCreateCompanionBuilder =
    OrderPaymentsCompanion Function({
      Value<int> id,
      required int orderId,
      required double amount,
      required String method,
      Value<DateTime> paidAt,
      Value<String?> reference,
      Value<int?> receivedBy,
    });
typedef $$OrderPaymentsTableUpdateCompanionBuilder =
    OrderPaymentsCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<double> amount,
      Value<String> method,
      Value<DateTime> paidAt,
      Value<String?> reference,
      Value<int?> receivedBy,
    });

final class $$OrderPaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $OrderPaymentsTable, OrderPayment> {
  $$OrderPaymentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrdersTable _orderIdTable(_$AppDatabase db) => db.orders.createAlias(
    $_aliasNameGenerator(db.orderPayments.orderId, db.orders.id),
  );

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderPaymentsTable> {
  $$OrderPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get receivedBy => $composableBuilder(
    column: $table.receivedBy,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderPaymentsTable> {
  $$OrderPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get receivedBy => $composableBuilder(
    column: $table.receivedBy,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableOrderingComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderPaymentsTable> {
  $$OrderPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<DateTime> get paidAt =>
      $composableBuilder(column: $table.paidAt, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<int> get receivedBy => $composableBuilder(
    column: $table.receivedBy,
    builder: (column) => column,
  );

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderPaymentsTable,
          OrderPayment,
          $$OrderPaymentsTableFilterComposer,
          $$OrderPaymentsTableOrderingComposer,
          $$OrderPaymentsTableAnnotationComposer,
          $$OrderPaymentsTableCreateCompanionBuilder,
          $$OrderPaymentsTableUpdateCompanionBuilder,
          (OrderPayment, $$OrderPaymentsTableReferences),
          OrderPayment,
          PrefetchHooks Function({bool orderId})
        > {
  $$OrderPaymentsTableTableManager(_$AppDatabase db, $OrderPaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<DateTime> paidAt = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<int?> receivedBy = const Value.absent(),
              }) => OrderPaymentsCompanion(
                id: id,
                orderId: orderId,
                amount: amount,
                method: method,
                paidAt: paidAt,
                reference: reference,
                receivedBy: receivedBy,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required double amount,
                required String method,
                Value<DateTime> paidAt = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<int?> receivedBy = const Value.absent(),
              }) => OrderPaymentsCompanion.insert(
                id: id,
                orderId: orderId,
                amount: amount,
                method: method,
                paidAt: paidAt,
                reference: reference,
                receivedBy: receivedBy,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderPaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable: $$OrderPaymentsTableReferences
                                    ._orderIdTable(db),
                                referencedColumn: $$OrderPaymentsTableReferences
                                    ._orderIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrderPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderPaymentsTable,
      OrderPayment,
      $$OrderPaymentsTableFilterComposer,
      $$OrderPaymentsTableOrderingComposer,
      $$OrderPaymentsTableAnnotationComposer,
      $$OrderPaymentsTableCreateCompanionBuilder,
      $$OrderPaymentsTableUpdateCompanionBuilder,
      (OrderPayment, $$OrderPaymentsTableReferences),
      OrderPayment,
      PrefetchHooks Function({bool orderId})
    >;
typedef $$OrderDiscountsTableCreateCompanionBuilder =
    OrderDiscountsCompanion Function({
      Value<int> id,
      required int orderId,
      required String discountType,
      required double value,
      Value<String?> reason,
    });
typedef $$OrderDiscountsTableUpdateCompanionBuilder =
    OrderDiscountsCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<String> discountType,
      Value<double> value,
      Value<String?> reason,
    });

final class $$OrderDiscountsTableReferences
    extends BaseReferences<_$AppDatabase, $OrderDiscountsTable, OrderDiscount> {
  $$OrderDiscountsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrdersTable _orderIdTable(_$AppDatabase db) => db.orders.createAlias(
    $_aliasNameGenerator(db.orderDiscounts.orderId, db.orders.id),
  );

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderDiscountsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderDiscountsTable> {
  $$OrderDiscountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderDiscountsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderDiscountsTable> {
  $$OrderDiscountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableOrderingComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderDiscountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderDiscountsTable> {
  $$OrderDiscountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderDiscountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderDiscountsTable,
          OrderDiscount,
          $$OrderDiscountsTableFilterComposer,
          $$OrderDiscountsTableOrderingComposer,
          $$OrderDiscountsTableAnnotationComposer,
          $$OrderDiscountsTableCreateCompanionBuilder,
          $$OrderDiscountsTableUpdateCompanionBuilder,
          (OrderDiscount, $$OrderDiscountsTableReferences),
          OrderDiscount,
          PrefetchHooks Function({bool orderId})
        > {
  $$OrderDiscountsTableTableManager(
    _$AppDatabase db,
    $OrderDiscountsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderDiscountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderDiscountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderDiscountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<String> discountType = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<String?> reason = const Value.absent(),
              }) => OrderDiscountsCompanion(
                id: id,
                orderId: orderId,
                discountType: discountType,
                value: value,
                reason: reason,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required String discountType,
                required double value,
                Value<String?> reason = const Value.absent(),
              }) => OrderDiscountsCompanion.insert(
                id: id,
                orderId: orderId,
                discountType: discountType,
                value: value,
                reason: reason,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderDiscountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable: $$OrderDiscountsTableReferences
                                    ._orderIdTable(db),
                                referencedColumn:
                                    $$OrderDiscountsTableReferences
                                        ._orderIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrderDiscountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderDiscountsTable,
      OrderDiscount,
      $$OrderDiscountsTableFilterComposer,
      $$OrderDiscountsTableOrderingComposer,
      $$OrderDiscountsTableAnnotationComposer,
      $$OrderDiscountsTableCreateCompanionBuilder,
      $$OrderDiscountsTableUpdateCompanionBuilder,
      (OrderDiscount, $$OrderDiscountsTableReferences),
      OrderDiscount,
      PrefetchHooks Function({bool orderId})
    >;
typedef $$OrderLogsTableCreateCompanionBuilder =
    OrderLogsCompanion Function({
      Value<int> id,
      required int orderId,
      required String status,
      Value<String?> comment,
      Value<int?> changedBy,
      Value<DateTime> timestamp,
    });
typedef $$OrderLogsTableUpdateCompanionBuilder =
    OrderLogsCompanion Function({
      Value<int> id,
      Value<int> orderId,
      Value<String> status,
      Value<String?> comment,
      Value<int?> changedBy,
      Value<DateTime> timestamp,
    });

final class $$OrderLogsTableReferences
    extends BaseReferences<_$AppDatabase, $OrderLogsTable, OrderLog> {
  $$OrderLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OrdersTable _orderIdTable(_$AppDatabase db) => db.orders.createAlias(
    $_aliasNameGenerator(db.orderLogs.orderId, db.orders.id),
  );

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderLogsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderLogsTable> {
  $$OrderLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get changedBy => $composableBuilder(
    column: $table.changedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderLogsTable> {
  $$OrderLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get changedBy => $composableBuilder(
    column: $table.changedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableOrderingComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderLogsTable> {
  $$OrderLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get changedBy =>
      $composableBuilder(column: $table.changedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderLogsTable,
          OrderLog,
          $$OrderLogsTableFilterComposer,
          $$OrderLogsTableOrderingComposer,
          $$OrderLogsTableAnnotationComposer,
          $$OrderLogsTableCreateCompanionBuilder,
          $$OrderLogsTableUpdateCompanionBuilder,
          (OrderLog, $$OrderLogsTableReferences),
          OrderLog,
          PrefetchHooks Function({bool orderId})
        > {
  $$OrderLogsTableTableManager(_$AppDatabase db, $OrderLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int?> changedBy = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => OrderLogsCompanion(
                id: id,
                orderId: orderId,
                status: status,
                comment: comment,
                changedBy: changedBy,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int orderId,
                required String status,
                Value<String?> comment = const Value.absent(),
                Value<int?> changedBy = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => OrderLogsCompanion.insert(
                id: id,
                orderId: orderId,
                status: status,
                comment: comment,
                changedBy: changedBy,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable: $$OrderLogsTableReferences
                                    ._orderIdTable(db),
                                referencedColumn: $$OrderLogsTableReferences
                                    ._orderIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrderLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderLogsTable,
      OrderLog,
      $$OrderLogsTableFilterComposer,
      $$OrderLogsTableOrderingComposer,
      $$OrderLogsTableAnnotationComposer,
      $$OrderLogsTableCreateCompanionBuilder,
      $$OrderLogsTableUpdateCompanionBuilder,
      (OrderLog, $$OrderLogsTableReferences),
      OrderLog,
      PrefetchHooks Function({bool orderId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db, _db.stores);
  $$StoreSettingsTableTableManager get storeSettings =>
      $$StoreSettingsTableTableManager(_db, _db.storeSettings);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db, _db.orderItems);
  $$CreditPlansTableTableManager get creditPlans =>
      $$CreditPlansTableTableManager(_db, _db.creditPlans);
  $$InstallmentPaymentsTableTableManager get installmentPayments =>
      $$InstallmentPaymentsTableTableManager(_db, _db.installmentPayments);
  $$OrderPaymentsTableTableManager get orderPayments =>
      $$OrderPaymentsTableTableManager(_db, _db.orderPayments);
  $$OrderDiscountsTableTableManager get orderDiscounts =>
      $$OrderDiscountsTableTableManager(_db, _db.orderDiscounts);
  $$OrderLogsTableTableManager get orderLogs =>
      $$OrderLogsTableTableManager(_db, _db.orderLogs);
}
