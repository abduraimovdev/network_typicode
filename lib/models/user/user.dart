import 'address.dart';
import 'company.dart';

class User {
	int id;
	String name;
	String username;
	String email;
	Address address;
	String phone;
	String website;
	Company company;

	User(
		this.id,
		this.name,
		this.username,
		this.email,
		this.address,
		this.phone,
		this.website,
		this.company,
	);

	factory User.fromJson(Map<String, Object?> json) {
		return User(
			json['id'] as int,
			json['name'] as String,
			json['username'] as String,
			json['email'] as String,
			Address.fromJson(json['address'] as Map<String, Object?>),
			json['phone'] as String,
			json['website'] as String,
			Company.fromJson(json['company'] as Map<String, Object?>),
		);
	}

	Map<String,Object?> toJson() => {
		'id': id,
		'name': name,
		'username': username,
		'email': email,
		'address': address.toJson(),
		'phone': phone,
		'website': website,
		'company': company.toJson(),
	};
}
