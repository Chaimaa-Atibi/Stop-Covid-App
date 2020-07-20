// GENERATED CODE - DO NOT MODIFY BY HAND

part of countries;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Countries> _$countriesSerializer = new _$CountriesSerializer();

class _$CountriesSerializer implements StructuredSerializer<Countries> {
  @override
  final Iterable<Type> types = const [Countries, _$Countries];
  @override
  final String wireName = 'Countries';

  @override
  Iterable<Object> serialize(Serializers serializers, Countries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.countryCode != null) {
      result
        ..add('countryCode')
        ..add(serializers.serialize(object.countryCode,
            specifiedType: const FullType(String)));
    }
    if (object.latitude != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(object.latitude,
            specifiedType: const FullType(double)));
    }
    if (object.longitude != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(object.longitude,
            specifiedType: const FullType(double)));
    }
    if (object.confirmed != null) {
      result
        ..add('confirmed')
        ..add(serializers.serialize(object.confirmed,
            specifiedType: const FullType(int)));
    }
    if (object.deaths != null) {
      result
        ..add('deaths')
        ..add(serializers.serialize(object.deaths,
            specifiedType: const FullType(int)));
    }
    if (object.recovered != null) {
      result
        ..add('recovered')
        ..add(serializers.serialize(object.recovered,
            specifiedType: const FullType(int)));
    }
    if (object.active != null) {
      result
        ..add('active')
        ..add(serializers.serialize(object.active,
            specifiedType: const FullType(int)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.deltaConfirmed != null) {
      result
        ..add('deltaConfirmed')
        ..add(serializers.serialize(object.deltaConfirmed,
            specifiedType: const FullType(int)));
    }
    if (object.deltaDeaths != null) {
      result
        ..add('deltaDeaths')
        ..add(serializers.serialize(object.deltaDeaths,
            specifiedType: const FullType(int)));
    }
    if (object.deltaRecovered != null) {
      result
        ..add('deltaRecovered')
        ..add(serializers.serialize(object.deltaRecovered,
            specifiedType: const FullType(int)));
    }
    if (object.deltaActive != null) {
      result
        ..add('deltaActive')
        ..add(serializers.serialize(object.deltaActive,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Countries deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'confirmed':
          result.confirmed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deaths':
          result.deaths = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'recovered':
          result.recovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deltaConfirmed':
          result.deltaConfirmed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deltaDeaths':
          result.deltaDeaths = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deltaRecovered':
          result.deltaRecovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deltaActive':
          result.deltaActive = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Countries extends Countries {
  @override
  final String country;
  @override
  final String countryCode;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int confirmed;
  @override
  final int deaths;
  @override
  final int recovered;
  @override
  final int active;
  @override
  final String updatedAt;
  @override
  final int deltaConfirmed;
  @override
  final int deltaDeaths;
  @override
  final int deltaRecovered;
  @override
  final int deltaActive;

  factory _$Countries([void Function(CountriesBuilder) updates]) =>
      (new CountriesBuilder()..update(updates)).build();

  _$Countries._(
      {this.country,
      this.countryCode,
      this.latitude,
      this.longitude,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.updatedAt,
      this.deltaConfirmed,
      this.deltaDeaths,
      this.deltaRecovered,
      this.deltaActive})
      : super._();

  @override
  Countries rebuild(void Function(CountriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountriesBuilder toBuilder() => new CountriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Countries &&
        country == other.country &&
        countryCode == other.countryCode &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        confirmed == other.confirmed &&
        deaths == other.deaths &&
        recovered == other.recovered &&
        active == other.active &&
        updatedAt == other.updatedAt &&
        deltaConfirmed == other.deltaConfirmed &&
        deltaDeaths == other.deltaDeaths &&
        deltaRecovered == other.deltaRecovered &&
        deltaActive == other.deltaActive;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, country.hashCode),
                                                    countryCode.hashCode),
                                                latitude.hashCode),
                                            longitude.hashCode),
                                        confirmed.hashCode),
                                    deaths.hashCode),
                                recovered.hashCode),
                            active.hashCode),
                        updatedAt.hashCode),
                    deltaConfirmed.hashCode),
                deltaDeaths.hashCode),
            deltaRecovered.hashCode),
        deltaActive.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Countries')
          ..add('country', country)
          ..add('countryCode', countryCode)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('confirmed', confirmed)
          ..add('deaths', deaths)
          ..add('recovered', recovered)
          ..add('active', active)
          ..add('updatedAt', updatedAt)
          ..add('deltaConfirmed', deltaConfirmed)
          ..add('deltaDeaths', deltaDeaths)
          ..add('deltaRecovered', deltaRecovered)
          ..add('deltaActive', deltaActive))
        .toString();
  }
}

class CountriesBuilder implements Builder<Countries, CountriesBuilder> {
  _$Countries _$v;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _countryCode;
  String get countryCode => _$this._countryCode;
  set countryCode(String countryCode) => _$this._countryCode = countryCode;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  int _confirmed;
  int get confirmed => _$this._confirmed;
  set confirmed(int confirmed) => _$this._confirmed = confirmed;

  int _deaths;
  int get deaths => _$this._deaths;
  set deaths(int deaths) => _$this._deaths = deaths;

  int _recovered;
  int get recovered => _$this._recovered;
  set recovered(int recovered) => _$this._recovered = recovered;

  int _active;
  int get active => _$this._active;
  set active(int active) => _$this._active = active;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _deltaConfirmed;
  int get deltaConfirmed => _$this._deltaConfirmed;
  set deltaConfirmed(int deltaConfirmed) =>
      _$this._deltaConfirmed = deltaConfirmed;

  int _deltaDeaths;
  int get deltaDeaths => _$this._deltaDeaths;
  set deltaDeaths(int deltaDeaths) => _$this._deltaDeaths = deltaDeaths;

  int _deltaRecovered;
  int get deltaRecovered => _$this._deltaRecovered;
  set deltaRecovered(int deltaRecovered) =>
      _$this._deltaRecovered = deltaRecovered;

  int _deltaActive;
  int get deltaActive => _$this._deltaActive;
  set deltaActive(int deltaActive) => _$this._deltaActive = deltaActive;

  CountriesBuilder();

  CountriesBuilder get _$this {
    if (_$v != null) {
      _country = _$v.country;
      _countryCode = _$v.countryCode;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _confirmed = _$v.confirmed;
      _deaths = _$v.deaths;
      _recovered = _$v.recovered;
      _active = _$v.active;
      _updatedAt = _$v.updatedAt;
      _deltaConfirmed = _$v.deltaConfirmed;
      _deltaDeaths = _$v.deltaDeaths;
      _deltaRecovered = _$v.deltaRecovered;
      _deltaActive = _$v.deltaActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Countries other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Countries;
  }

  @override
  void update(void Function(CountriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Countries build() {
    final _$result = _$v ??
        new _$Countries._(
            country: country,
            countryCode: countryCode,
            latitude: latitude,
            longitude: longitude,
            confirmed: confirmed,
            deaths: deaths,
            recovered: recovered,
            active: active,
            updatedAt: updatedAt,
            deltaConfirmed: deltaConfirmed,
            deltaDeaths: deltaDeaths,
            deltaRecovered: deltaRecovered,
            deltaActive: deltaActive);
    replace(_$result);
    return _$result;
  }
}
