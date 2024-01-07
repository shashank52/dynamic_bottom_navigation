import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTabItems extends Equatable {
  final String title;
  final IconData icon;
  final Widget child;

  const AppTabItems(
      {required this.title, required this.icon, required this.child});

  @override
  List<Object> get props => [title, icon, child];
}
