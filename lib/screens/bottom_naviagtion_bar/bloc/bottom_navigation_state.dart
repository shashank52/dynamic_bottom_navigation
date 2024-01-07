part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationLoadingState extends BottomNavigationState {
  const BottomNavigationLoadingState();

  @override
  List<Object> get props => [];
}

class BottomNavigationLoadedState extends BottomNavigationState {
  final int selectedIndex;
  final List<AppTabItems> appTabItems;
  const BottomNavigationLoadedState(
      {required this.selectedIndex, required this.appTabItems});

  BottomNavigationLoadedState copyWith(
      {int? selectedIndex, List<AppTabItems>? appTabItems}) {
    return BottomNavigationLoadedState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        appTabItems: appTabItems ?? this.appTabItems);
  }

  @override
  List<Object> get props => [selectedIndex, appTabItems];
}
