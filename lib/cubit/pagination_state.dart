import 'package:pagenation_app/data/model/techrunch_model.dart';

abstract class PaginationState {}

class InitialState extends PaginationState {}

class LoadInProgress extends PaginationState {}

class LoadInSuccess extends PaginationState {
  final List<TechrunchModel> orders;

  LoadInSuccess({
    required this.orders,
  });
}

class LoadInFailure extends PaginationState {}