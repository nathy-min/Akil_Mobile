import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/ngo_page_entity.dart';
import '../../domain/usecases/get_ngo_page_data.dart';

part 'ngo_page_event.dart';
part 'ngo_page_state.dart';

class NgoPageBloc extends Bloc<NgoPageEvent, NgoPageState> {
  final GetNgoPageData getNgoPageData;

  NgoPageBloc({required this.getNgoPageData}) : super(NgoPageLoadInProgress()) {
    on<GetNgoPageDataEvent>((event, emit) async {
      emit(NgoPageLoadInProgress());
      try {
        final data = await getNgoPageData();
        emit(NgoPageLoadSuccess(data));
      } catch (_) {
        emit(NgoPageLoadFailure());
      }
    });
  }
}
