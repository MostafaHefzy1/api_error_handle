import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/services/di.dart';
import 'package:flutter_application_5/features/home/data/models/todo_model.dart';
import 'package:flutter_application_5/features/home/logic/home_cubit.dart';
import 'package:flutter_application_5/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For date formatting

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt())
        ..getHomeData(1)
        ..functionPagination(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text('Data Display'),
                centerTitle: true,
              ),
              body: cubit.listToDoItem == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: cubit.scrollController,
                      itemBuilder: (context, index) {
                        if (index < cubit.listToDoItem!.length) {
                          return ToDoItemWidget(
                            toDoItem: cubit.listToDoItem![index],
                          );
                        } else if (cubit.checkListToDoItem!.isNotEmpty) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SizedBox();
                        }
                      },
                      itemCount: cubit.listToDoItem!.length + 1));
        },
      ),
    );
  }
}

class ToDoItemWidget extends StatelessWidget {
  final ToDoItem toDoItem;

  const ToDoItemWidget({super.key, required this.toDoItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image

              // Title
              Text(
                toDoItem.title ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                toDoItem.desc ?? "",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              // Priority and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.priority_high, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        'Priority: ${toDoItem.priority ?? ""}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.pending, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(
                        'Status: ${toDoItem.status ?? ""}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Created At
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(
                    'Created At: ${toDoItem.createdAt ?? ""}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
