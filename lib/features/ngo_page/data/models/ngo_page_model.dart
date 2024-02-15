
import '../../domain/entities/ngo_page_entity.dart';

class NgoPageModel extends NgoPageEntity {
  NgoPageModel({
    required String id,
    required String orgName,
    required List<String> orgArea,
    required String description,
    required String logoUrl,
    required int oppCount,
    required String year,
  }) : super(
          id: id,
          orgName: orgName,
          orgArea: orgArea,
          description: description,
          logoUrl: logoUrl,
          oppCount: oppCount,
          year: year,
        );

  factory NgoPageModel.fromJson(Map<String, dynamic> json) {
    return NgoPageModel(
      id: json['id'],
      orgName: json['orgName'],
      orgArea: List<String>.from(json['orgArea']),
      description: json['description'],
      logoUrl: json['LogoUrl'],
      oppCount: json['oppCount'],
      year: json['year'],
    );
  }
}
