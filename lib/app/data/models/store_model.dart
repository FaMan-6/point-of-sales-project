class Store {
  final int id;
  final String name;
  final String address;
  final String phone;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json['id'],
    name: json['name'],
    address: json['address'],
    phone: json['phone'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone': phone,
  };
}
