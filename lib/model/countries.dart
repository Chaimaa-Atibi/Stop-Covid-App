library countries;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:covid_test_app/model/serializers.dart';

part 'countries.g.dart';

abstract class Countries implements Built<Countries, CountriesBuilder> {
  Countries._();

  factory Countries([updates(CountriesBuilder b)]) = _$Countries;

  @nullable
  @BuiltValueField(wireName: 'country')
  String get country;
  @nullable
  @BuiltValueField(wireName: 'countryCode')
  String get countryCode;
  @nullable
  @BuiltValueField(wireName: 'latitude')
  double get latitude;
  @nullable
  @BuiltValueField(wireName: 'longitude')
  double get longitude;
  @nullable
  @BuiltValueField(wireName: 'confirmed')
  int get confirmed;
  @nullable
  @BuiltValueField(wireName: 'deaths')
  int get deaths;
  @nullable
  @BuiltValueField(wireName: 'recovered')
  int get recovered;
  @nullable
  @BuiltValueField(wireName: 'active')
  int get active;
  @nullable
  @BuiltValueField(wireName: 'updatedAt')
  String get updatedAt;
  @nullable
  @BuiltValueField(wireName: 'deltaConfirmed')
  int get deltaConfirmed;
  @nullable
  @BuiltValueField(wireName: 'deltaDeaths')
  int get deltaDeaths;
  @nullable
  @BuiltValueField(wireName: 'deltaRecovered')
  int get deltaRecovered;
  @nullable
  @BuiltValueField(wireName: 'deltaActive')
  int get deltaActive;
  String toJson() {
    return json.encode(serializers.serializeWith(Countries.serializer, this));
  }

  static Countries fromJson(String jsonString) {
    return serializers.deserializeWith(
        Countries.serializer, json.decode(jsonString));
  }

  static Serializer<Countries> get serializer => _$countriesSerializer;
}
