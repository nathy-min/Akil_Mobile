part of 'ngo_page_bloc.dart';

@immutable
abstract class NgoPageState {}

class NgoPageLoadInProgress extends NgoPageState {}

class NgoPageLoadSuccess extends NgoPageState {
  final List<NgoPageEntity> data;

  NgoPageLoadSuccess(this.data);
}

class NgoPageLoadFailure extends NgoPageState {}
