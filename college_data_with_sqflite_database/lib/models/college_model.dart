class collegeModel{
  int id;
  String name;
  String description;
  String location;
  int star;

  collegeModel({

    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.star,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'star': star,
    };
  }


  factory collegeModel.fromMap(Map<String, dynamic> map) {
    return collegeModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      location: map['location'],
      star: map['star'],
    );
  }

}
