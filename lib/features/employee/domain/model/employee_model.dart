class EmployeeModel {
  final int id;
  final String name;
  final String role;
  final String avatar;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.avatar,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}
