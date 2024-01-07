import 'package:dynamic_bottom_navigation/screens/bottom_naviagtion_bar/model/app_tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_navigation_bloc.dart';

class BottomNavigationBarView extends StatelessWidget {
  final int items;
  const BottomNavigationBarView({super.key, this.items = 4});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc()
        ..add(BottomNavigationTriggerEvent(items: items)),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
        if (state is BottomNavigationLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is BottomNavigationLoadedState) {
          return _buildSuccess(context, state);
        }
        return const Center(child: Text('Error'));
      }),
    );
  }

  Widget _buildSuccess(
      BuildContext context, BottomNavigationLoadedState state) {
    final bloc = BlocProvider.of<BottomNavigationBloc>(context);
    List<BottomNavigationBarItem> getBottomTabs(List<AppTabItems> appTabItems) {
      return appTabItems
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
          .toList();
    }

    return WillPopScope(
      onWillPop: () async {
        if (state.selectedIndex != 0) {
          bloc.add(const BottomNavigationUpdateEvent(index: 0));
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: state.appTabItems[state.selectedIndex].child,
        bottomNavigationBar: BottomNavigationBar(
          items: getBottomTabs(state.appTabItems),
          onTap: (value) => bloc.add(BottomNavigationUpdateEvent(index: value)),
          showUnselectedLabels: true,
          currentIndex: state.selectedIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
