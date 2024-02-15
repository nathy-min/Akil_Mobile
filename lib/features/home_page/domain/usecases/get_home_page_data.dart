import '../entities/home_page_entity.dart';
import '../repositories/home_page_repository.dart';

class GetHomePageData {
  final HomePageRepository repository;

  GetHomePageData(this.repository);

  Future<List<HomePageEntity>> call() {
    return repository.getHomePageData();
  }
}
