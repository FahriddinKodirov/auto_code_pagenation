import 'package:bloc/bloc.dart';
import 'package:pagenation_app/cubit/pagination_state.dart';
import 'package:pagenation_app/services/api/api_service.dart';
import 'package:pagenation_app/data/model/techrunch_model.dart';


class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(InitialState());

  List<TechrunchModel> data = [];
  bool isFinished = false;

  void loadOrders({ required int page, required int size}) async {
    if (page == 0) {
      data = [];
    }
    await Future.delayed(const Duration(seconds: 2));
    var orders = await MyRepository.getOrdersList(size:size, page:page);
    data.addAll(orders);
    emit(LoadInSuccess(
      orders: data,
    ));
    isFinished = orders.length < size;
  }
}