part of 'bottom_nav_intent_cubit.dart';

sealed class BottomNavIntentState extends Equatable {
  const BottomNavIntentState();
}

final class BottomNavIntentInitial extends BottomNavIntentState {
  @override
  List<Object> get props => [];
}
