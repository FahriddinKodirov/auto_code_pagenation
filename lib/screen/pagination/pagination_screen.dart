import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagenation_app/cubit/pagination_cubit.dart';
import 'package:pagenation_app/cubit/pagination_state.dart';
import 'package:pagenation_app/data/model/techrunch_model.dart';
import 'package:pagenation_app/utils/my_utils.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({Key? key}) : super(key: key);

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  int page = 0;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _loadMore(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMore(page);
      }
    });
    super.initState();
  }

  _loadMore(int index) async {
    var cubit = BlocProvider.of<PaginationCubit>(context);
    if (!cubit.isFinished) {
      cubit.loadOrders(size:index, page: 3);
      page++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Example"),
      ),
      body: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          if (state is LoadInProgress) {
            return const CircularProgressIndicator();
          } else if (state is LoadInSuccess) {
            List<TechrunchModel> orders = state.orders;
            print("ORDERS LENGTH:${state.orders.length}");
            return ListView.builder(
              controller: scrollController,
              itemCount: orders.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index == orders.length) {
                  return Opacity(
                    opacity:
                        context.read<PaginationCubit>().isFinished ? 0.0 : 1.0,
                    child: const SizedBox(
                      height: 40,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  var item = state.orders[index];
                  return Column(
                            children: [
                              Text(item.date,style:const TextStyle(color: Colors.black),),
                              Image.network(item.jetpackFeaturedMediaUrl),
                            ],
                          );
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}