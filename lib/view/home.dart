import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/provider.dart';
import 'package:movie_cafe/view/home2.dart';
import 'package:movie_cafe/view/indian.dart';
import 'package:movie_cafe/view/search.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final color1 =
    //     ref.read(colorProvider.notifier).state ? Colors.white : Colors.black;
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (value) {
          ref.read(bottomProvider.notifier).state = value;
        },
        children: [
          Home2(),
          Indian(),
          Search(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: Mobile1.width(60, context),
        child: BottomNavigationBar(
            backgroundColor:
                ref.watch(colorProvider) ? Colors.white : Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.red,
            unselectedItemColor: ref.read(colorProvider.notifier).state
                ? Colors.black
                : Colors.white,
            currentIndex: ref.watch(bottomProvider),
            onTap: (value) {
              ref.read(bottomProvider.notifier).state = value;
              pagecontroller.animateToPage(value,
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.linear);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    size: Mobile1.width(28, context),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.film,
                    size: Mobile1.width(28, context),
                  ),
                  label: 'movies'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.search,
                    size: Mobile1.width(28, context),
                  ),
                  label: 'Movie'),
            ]),
      ),
    );
  }
}
