import 'package:dio/dio.dart';
import 'package:akil/features/ngo_page/data/models/ngo_page_model.dart';

class NgoPageRemoteDataSource {
  final Dio dio;

  NgoPageRemoteDataSource({required this.dio});

  Future<List<NgoPageModel>> getNgoPageData() async {
    final response = await dio.get('https://akil-backend-ij7jnmwh2q-zf.a.run.app/organizations/all');
    return (response.data['data'] as List)
        .map((item) => NgoPageModel.fromJson(item))
        .toList();
  }
}
