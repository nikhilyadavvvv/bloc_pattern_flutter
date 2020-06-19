// To parse this JSON data, do
//
//     final userCreated = userCreatedFromJson(jsonString);

import 'dart:convert';

UserCreated userCreatedFromJson(String str) => UserCreated.fromJson(json.decode(str));

String userCreatedToJson(UserCreated data) => json.encode(data.toJson());

class UserCreated {
    UserCreated({
        this.name,
        this.job,
        this.id,
        this.createdAt,
    });

    String name;
    String job;
    String id;
    DateTime createdAt;

    factory UserCreated.fromJson(Map<String, dynamic> json) => UserCreated(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}
