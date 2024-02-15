class HomePageEntity {
  final String id;
  final String title;
  final String description;
  final List<String> categories;
  final String opType;
  final List<String> location;
  final String logoUrl;
  final String updatedAt;
  final String status;
  final String orgName;

  HomePageEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.categories,
    required this.opType,
    required this.location,
    required this.logoUrl,
    required this.updatedAt,
    required this.status,
    required this.orgName,
  });
  factory HomePageEntity.fromJson(Map<String, dynamic> json) {
    return HomePageEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      categories: List<String>.from(json['categories']),
      opType: json['opType'],
      location: List<String>.from(json['location']),
      logoUrl: json['logoUrl'],
      updatedAt: json['updatedAt'],
      status: json['status'],
      orgName: json['orgName'],
    );
  }

}
