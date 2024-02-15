import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/home_page_entity.dart';
import '../../domain/usecases/get_home_page_data.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetHomePageData getHomePageData;

  HomePageBloc({required this.getHomePageData}) : super(HomePageLoadInProgress()) {
    on<GetHomePageDataEvent>((event, emit) async {
      emit(HomePageLoadInProgress());
      try {
        final data = await getHomePageData();
        emit(HomePageLoadSuccess(data));
      } catch (_) {
        emit(HomePageLoadFailure());
      }
    });
  }
}


