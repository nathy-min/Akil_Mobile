class NgoPageEntity {
  final String id;
  final String orgName;
  final List<String> orgArea;
  final String description;
  final String logoUrl;
  final int oppCount;
  final String year;

  NgoPageEntity({
    required this.id,
    required this.orgName,
    required this.orgArea,
    required this.description,
    required this.logoUrl,
    required this.oppCount,
    required this.year,
  });
}
