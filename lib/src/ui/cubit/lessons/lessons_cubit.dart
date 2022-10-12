import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());
}
