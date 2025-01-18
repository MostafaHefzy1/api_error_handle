import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/features/home/data/models/todo_model.dart';
import 'package:flutter_application_5/features/home/data/repository/home_reposity.dart';
import 'package:flutter_application_5/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeReposity _homeReposity;
  HomeCubit(this._homeReposity) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<ToDoItem>? checkListToDoItem = [];
  List<ToDoItem>? listToDoItem = [];

  void getHomeData(int page) async {
    var result = await _homeReposity.getToDos(page);
    result.when(success: (value) {
      checkListToDoItem = value;
      listToDoItem!.addAll(value);
      emit(HomeSuccessState());
    }, failure: (error) {
      emit(HomeFailureState(error));
    });
  }

  ScrollController scrollController = ScrollController();
  int page = 1;
  void functionPagination() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (checkListToDoItem!.isEmpty) return;
        page++;
        getHomeData(page);
      }
    });
  }
}
