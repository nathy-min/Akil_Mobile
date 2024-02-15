part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageLoadInProgress extends HomePageState {}

class HomePageLoadSuccess extends HomePageState {
  final List<HomePageEntity> data;

  HomePageLoadSuccess(this.data);
}

class HomePageLoadFailure extends HomePageState {}
