import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/apiProvider.dart';
import 'package:movie_cafe/provider/provider.dart';
import 'package:movie_cafe/view/review_page.dart';

class Malayalam extends ConsumerWidget {
  const Malayalam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mlm = ref.watch(malayalamProvider);
    final color1 =
        ref.read(colorProvider.notifier).state ? Colors.white : Colors.black;
    final color2 =
        ref.read(colorProvider.notifier).state ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: color1,
      body: mlm.when(
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text('Error found'),
            );
          }
          return GridView.builder(
            itemCount: data.results!.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                crossAxisSpacing: Mobile1.width(6, context),
                mainAxisSpacing: Mobile1.width(6, context)),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReviewPage(review: data.results![index]),
                      ));
                },
                child: data.results![index].posterPath == null
                    ? Icon(
                        Icons.person_rounded,
                        color: color2,
                        size: Mobile1.width(60, context),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${data.results![index].posterPath!}'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(
                                Mobile1.width(0, context)),
                            color: Colors.red),
                      ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
