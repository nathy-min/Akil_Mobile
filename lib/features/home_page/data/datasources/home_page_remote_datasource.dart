import 'package:dio/dio.dart';
import 'package:akil/features/home_page/data/models/home_page_model.dart';

class HomePageRemoteDataSource {
  final Dio dio;

  HomePageRemoteDataSource({required this.dio});

  Future<List<HomePageModel>> getHomePageData() async {
    final response = await dio.get('https://akil-backend-ij7jnmwh2q-zf.a.run.app/opportunities/search');
    return (response.data['data'] as List)
        .map((item) => HomePageModel.fromJson(item))
        .toList();
  }
}
