import '../entities/ngo_page_entity.dart';
import '../repositories/ngo_page_repository.dart';

class GetNgoPageData {
  final NgoPageRepository repository;

  GetNgoPageData(this.repository);

  Future<List<NgoPageEntity>> call() {
    return repository.getNgoPageData();
  }
}
