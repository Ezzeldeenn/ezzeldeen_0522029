class RegisterModel {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;
  final bool status;

  RegisterModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
    required this.status,
  });

  factory RegisterModel.fromjson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json["data"]["name"],
      phone: json["data"]["phone"],
      email: json["data"]["email"],
      id: json["data"]["id"],
      image: json["data"]["image"],
      token: json["data"]["token"],
      status: json["status"],
    );
  }
}