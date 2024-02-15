
import '../../domain/entities/home_page_entity.dart';

class HomePageModel extends HomePageEntity {
  HomePageModel({
    required String id,
    required String title,
    required String description,
    required List<String> categories,
    required String opType,
    required List<String> location,
    required String logoUrl,
    required String updatedAt,
    required String status,
    required String orgName,
  }) : super(
          id: id,
          title: title,
          description: description,
          categories: categories,
          opType: opType,
          location: location,
          logoUrl: logoUrl,
          updatedAt: updatedAt,
          status: status,
          orgName: orgName,
        );

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(
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
