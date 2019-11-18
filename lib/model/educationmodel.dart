class EdModel {
  var id;
  var degree;
  var university;
  var year;
  var cpi;

  EdModel({
    this.id,
    this.degree,
    this.university,
    this.year,
    this.cpi,
  });
  factory EdModel.fromJson(Map<String, dynamic> json) {
    return EdModel(
        id: json['id'],
        degree: json['degree'],
        university: json['university'],
        year: json['year'],
        cpi:json['cpi']

    );
  }


}
class Users {
  int id;
  String name;
  String username;
  String email;

  Users({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}