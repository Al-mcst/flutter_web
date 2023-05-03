import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    // required this.firstName,
    // required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
  });

  final String id;
  final String name;
  // final String firstName;
  // final String lastName;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        // firstName: json['firstName'] ?? "",
        // lastName: json['lastName'] ?? "",
        email: json['email'] ?? "",
        phoneNumber: json['phoneNumber'] ?? "",
        imageUrl: json['imageUrl'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,

        // 'firstName': firstName,
        // 'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'imageUrl': imageUrl,
      };
  factory UserEntity.empty() => const UserEntity(
        id: "",
        name: "",
        // firstName: "",
        // lastName: "",
        email: "",
        phoneNumber: "",
        imageUrl: "",
      );
  @override
  List<Object?> get props => [id, name, email, phoneNumber, imageUrl];
}
