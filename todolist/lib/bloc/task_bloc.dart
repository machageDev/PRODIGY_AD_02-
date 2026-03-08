import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/task_event.dart';
import 'package:todolist/bloc/task_state.dart';
import 'package:todolist/models/task_model.dart';
  
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState(tasks: [])) {

    on<AddTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(TaskState(tasks: updatedTasks));
    });

    on<DeleteTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..removeAt(event.index!);
      emit(TaskState(tasks: updatedTasks));
    });

    on<ToggleTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks);
      final task = updatedTasks[event.index];

      updatedTasks[event.index] =
          task.copyWith(isCompleted: !task.isCompleted);

      emit(TaskState(tasks: updatedTasks));
    });

  }
}