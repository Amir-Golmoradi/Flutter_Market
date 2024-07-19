import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_intent_state.dart';

class BottomNavIntentCubit extends Cubit<BottomNavIntentState> {
  BottomNavIntentCubit() : super(BottomNavIntentInitial());
}
