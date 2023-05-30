class Geo {
	String lat;
	String lng;

	Geo(
		this.lat,
		this.lng,
	);

	factory Geo.fromJson(Map<String, Object?> json) {
		return Geo(
			json['lat'] as String,
			json['lng'] as String,
		);
	}

	Map<String,Object?> toJson() => {
		'lat': lat,
		'lng': lng,
	};
}
