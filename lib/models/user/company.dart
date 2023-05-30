class Company {
	String name;
	String catchPhrase;
	String bs;

	Company(
		this.name,
		this.catchPhrase,
		this.bs,
	);

	factory Company.fromJson(Map<String, Object?> json) {
		return Company(
			json['name'] as String,
			json['catchPhrase'] as String,
			json['bs'] as String,
		);
	}

	Map<String,Object?> toJson() => {
		'name': name,
		'catchPhrase': catchPhrase,
		'bs': bs,
	};
}
