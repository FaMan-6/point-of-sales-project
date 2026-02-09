class EmployeeModel {
  final int id;
  final String name;
  final String role;

  EmployeeModel({required this.id, required this.name, required this.role});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'role': role};
  }
}
