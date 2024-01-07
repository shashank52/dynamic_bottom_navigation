import 'package:bloc/bloc.dart';
import 'package:dynamic_bottom_navigation/screens/bottom_naviagtion_bar/model/app_tab_items.dart';
import 'package:dynamic_bottom_navigation/screens/cart/view/cart_view.dart';
import 'package:dynamic_bottom_navigation/screens/categories/view/categories_view.dart';
import 'package:dynamic_bottom_navigation/screens/home/view/home_view.dart';
import 'package:dynamic_bottom_navigation/screens/menu/view/menu_view.dart';
import 'package:dynamic_bottom_navigation/screens/offers/view/offers_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationLoadingState()) {
    on<BottomNavigationTriggerEvent>((event, emit) {
      //trigger an api to get the custom tabs for bottom naviagtion bar
      // for demo using mock data
      List<AppTabItems> appTabItems = [
        const AppTabItems(
            title: 'Home', icon: Icons.home_filled, child: HomeView()),
        const AppTabItems(
            title: 'Categories',
            icon: Icons.grid_view_outlined,
            child: CategoriesView()),
        const AppTabItems(
            title: 'Offers',
            icon: Icons.inventory_2_outlined,
            child: OffersView()),
        const AppTabItems(
            title: 'Cart',
            icon: Icons.shopping_cart_outlined,
            child: CartView()),
        const AppTabItems(
            title: 'Menu', icon: Icons.dehaze_sharp, child: MenuView())
      ];

      if (event.items == 4) {
        appTabItems = appTabItems.sublist(0, 4);
      }

      emit(BottomNavigationLoadedState(
          selectedIndex: 0, appTabItems: appTabItems));
    });

    on<BottomNavigationUpdateEvent>((event, emit) {
      if (state is BottomNavigationLoadedState) {
        emit((state as BottomNavigationLoadedState)
            .copyWith(selectedIndex: event.index));
      }
    });
  }
}
