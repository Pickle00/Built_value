library built_vehicle;

// import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'built_vehicle.g.dart';

abstract class UserAddress implements Built<UserAddress, UserAddressBuilder> {
  String get street;
  String get city;
  String get zipcode;

  UserAddress._();

  factory UserAddress([void Function(UserAddressBuilder) update]) =
      _$UserAddress;

  static Serializer<UserAddress> get serializer => _$userAddressSerializer;
}

abstract class UserDetail implements Built<UserDetail, UserDetailBuilder> {
  UserAddress get address;
  String get name;
  String get username;
  String get email;

  UserDetail._();

  factory UserDetail([void Function(UserDetailBuilder) update]) = _$UserDetail;

  static Serializer<UserDetail> get serializer => _$userDetailSerializer;
}
