part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationTriggerEvent extends BottomNavigationEvent {
  final int items;
  const BottomNavigationTriggerEvent({this.items = 4});

  @override
  List<Object> get props => [items];
}

class BottomNavigationUpdateEvent extends BottomNavigationEvent {
  final int index;
  const BottomNavigationUpdateEvent({required this.index});

  @override
  List<Object> get props => [index];
}
