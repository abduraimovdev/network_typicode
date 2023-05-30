import 'geo.dart';

class Address {
	String street;
	String suite;
	String city;
	String zipcode;
	Geo geo;

	Address(
		this.street,
		this.suite,
		this.city,
		this.zipcode,
		this.geo,
	);

	factory Address.fromJson(Map<String, Object?> json) {
		return Address(
			json['street'] as String,
			json['suite'] as String,
			json['city'] as String,
			json['zipcode'] as String,
			Geo.fromJson(json['geo'] as Map<String, Object?>),
		);
	}

	Map<String,Object?> toJson() => {
		'street': street,
		'suite': suite,
		'city': city,
		'zipcode': zipcode,
		'geo': geo.toJson(),
	};
}
