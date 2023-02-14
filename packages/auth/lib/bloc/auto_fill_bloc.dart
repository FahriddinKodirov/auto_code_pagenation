import 'package:flutter_bloc/flutter_bloc.dart';
import 'auto_fill_event.dart';
import 'auto_fill_state.dart';

class AutoFillBloc extends Bloc<AutoFillEvent, AutoFillState> {

 AutoFillBloc():super(InitialAutoFillState()) {
  on<FetchAutoFill>(_fetchAutoFill);
 }


_fetchAutoFill(FetchAutoFill event, Emitter<AutoFillState> emit) {
  emit(LoadAutoFillInSuccess(codeAutoFill: event.code));

}


}