class HeroModel {
  int id;
  String name;
  String description;
  String url;

  HeroModel({this.id, this.name, this.description, this.url});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["thumbnail"]["path"] + '.' + json["thumbnail"]["extension"];
  }
}
