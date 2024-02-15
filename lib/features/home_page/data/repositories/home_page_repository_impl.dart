import 'package:akil/features/home_page/data/datasources/home_page_remote_datasource.dart';
import 'package:akil/features/home_page/domain/entities/home_page_entity.dart';
import 'package:akil/features/home_page/domain/repositories/home_page_repository.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final HomePageRemoteDataSource remoteDataSource;

  HomePageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<HomePageEntity>> getHomePageData() async {
    final data = await remoteDataSource.getHomePageData();
    return data;
  }
}
