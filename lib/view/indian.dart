import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/provider.dart';
import 'package:movie_cafe/view/hindi.dart';
import 'package:movie_cafe/view/kannada.dart';
import 'package:movie_cafe/view/malayalam.dart';

import 'package:movie_cafe/view/tamil.dart';

class Indian extends ConsumerWidget {
  const Indian({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color1 =
        ref.read(colorProvider.notifier).state ? Colors.white : Colors.black;
    final color2 =
        ref.read(colorProvider.notifier).state ? Colors.black : Colors.white;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: color1,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor:
                  ref.watch(colorProvider) ? Colors.white : Colors.black,
              title: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red[700],
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    child: Text(
                      'Malayalam',
                      style: TextStyle(
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(16, context)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Tamil',
                      style: TextStyle(
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(16, context)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Hindi',
                      style: TextStyle(
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(16, context)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Kannada',
                      style: TextStyle(
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(16, context)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              Malayalam(),
              Tamil(),
              Hindi(),
              Kannada(),
            ],
          ),
        ),
      ),
    );
  }
}
