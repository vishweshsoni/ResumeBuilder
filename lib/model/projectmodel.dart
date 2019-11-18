//{
//  "error": false,
//  "message": "success",
//  "data": {
//        "id": 3,
//        "degree": "BSc Ele",
//        "university": "Gujarat University",
//        "year": "2017",
//        "cpi": "6.9"
//    }
//}


class ProjectModel {
  var id;
  var description;
  var title;
  var duration;
  var mentor;
  var team_size;

  ProjectModel({
    this.id,
    this.description,
    this.title,
    this.duration,
    this.mentor,
    this.team_size,
  });
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        description: json['description'],
        title: json['title'],
        duration: json['duration'],
        mentor:json['mentor'],
        team_size:json['team_size']

    );
  }


}
