import '../entities/home_page_entity.dart';

abstract class HomePageRepository {
  Future<List<HomePageEntity>> getHomePageData();
}
