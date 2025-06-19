import 'package:flutter/material.dart';
import 'package:khata_tracker/shared/widgets/app_drawer.dart';
import 'package:khata_tracker/shared/widgets/custom_app_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool showDrawer;

  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.showDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, actions: actions),
      drawer: showDrawer ? const AppDrawer() : null,
      body: SafeArea(child: child),
    );
  }
}
