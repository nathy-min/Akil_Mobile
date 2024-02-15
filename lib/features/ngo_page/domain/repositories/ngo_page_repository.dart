import '../entities/ngo_page_entity.dart';

abstract class NgoPageRepository {
  Future<List<NgoPageEntity>> getNgoPageData();
}
