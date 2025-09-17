import 'package:flutter/material.dart';
import '../widgets/app_nav_rail.dart';
import 'generator_page.dart';
import 'favorites_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        page = const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraint) {
        final extended = constraint.maxWidth >= 600;
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: AppNavRail(
                  extended: extended,
                  selectedIndex: _selectedIndex,
                  onSelected: (i) => setState(() => _selectedIndex = i),
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
