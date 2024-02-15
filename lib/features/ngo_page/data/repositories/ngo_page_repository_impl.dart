import 'package:akil/features/ngo_page/data/datasources/ngo_page_remote_datasource.dart';
import 'package:akil/features/ngo_page/domain/entities/ngo_page_entity.dart';
import 'package:akil/features/ngo_page/domain/repositories/ngo_page_repository.dart';

class NgoPageRepositoryImpl implements NgoPageRepository {
  final NgoPageRemoteDataSource remoteDataSource;

  NgoPageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<NgoPageEntity>> getNgoPageData() async {
    final data = await remoteDataSource.getNgoPageData();
    return data;
  }
}
