import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:akil/features/home_page/presentation/bloc/home_page_bloc.dart';
import 'package:akil/features/home_page/presentation/pages/home_page.dart';
import 'package:akil/features/home_page/domain/usecases/get_home_page_data.dart';
import 'package:akil/features/home_page/data/repositories/home_page_repository_impl.dart';
import 'package:akil/features/home_page/data/datasources/home_page_remote_datasource.dart';
import 'package:akil/features/ngo_page/presentation/bloc/ngo_page_bloc.dart';
import 'package:akil/features/ngo_page/presentation/pages/ngo_page.dart';
import 'package:akil/features/ngo_page/domain/usecases/get_ngo_page_data.dart';
import 'package:akil/features/ngo_page/data/repositories/ngo_page_repository_impl.dart';
import 'package:akil/features/ngo_page/data/datasources/ngo_page_remote_datasource.dart';
import 'package:dio/dio.dart';

void main() {
  final dio = Dio();
  final homePageRemoteDataSource = HomePageRemoteDataSource(dio: dio);
  final homePageRepository = HomePageRepositoryImpl(remoteDataSource: homePageRemoteDataSource);
  final getHomePageData = GetHomePageData(homePageRepository);
  final ngoPageRemoteDataSource = NgoPageRemoteDataSource(dio: dio);
  final ngoPageRepository = NgoPageRepositoryImpl(remoteDataSource: ngoPageRemoteDataSource);
  final getNgoPageData = GetNgoPageData(ngoPageRepository);

  runApp(MyApp(
    homePageBloc: HomePageBloc(getHomePageData: getHomePageData),
    ngoPageBloc: NgoPageBloc(getNgoPageData: getNgoPageData),
  ));
}

class MyApp extends StatelessWidget {
  final HomePageBloc homePageBloc;
  final NgoPageBloc ngoPageBloc;

  MyApp({required this.homePageBloc, required this.ngoPageBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => homePageBloc..add(GetHomePageDataEvent()),
        child: HomePage(ngoPageBloc: ngoPageBloc),
      ),
    );
  }
}
