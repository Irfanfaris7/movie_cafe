import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/Model/castmodel.dart';

import 'package:movie_cafe/Model/tvmodel.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/apiProvider.dart';

import 'package:movie_cafe/provider/provider.dart';

class ReviewPage2 extends ConsumerWidget {
  ReviewPage2({
    super.key,
    required this.review1,
  });
  final Result1 review1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.watch(readProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Mobile1.width(30, context),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Mobile1.width(250, context),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(review1.backdropPath == null
                              ? 'https://image.tmdb.org/t/p/w500${review1.posterPath}'
                              : 'https://image.tmdb.org/t/p/w500${review1.backdropPath}'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: Mobile1.width(20, context),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: Mobile1.width(28, context),
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                  left: Mobile1.width(40, context),
                  top: Mobile1.width(150, context),
                  child: Container(
                    width: Mobile1.width(120, context),
                    height: Mobile1.width(160, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${review1.posterPath}'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Mobile1.width(76, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Mobile1.width(26, context),
                  right: Mobile1.width(20, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Mobile1.width(250, context),
                    child: Text(
                      'Name : ${review1.originalName!}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: Mobile1.width(22, context)),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(6, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Mobile1.width(18, context),
                        child: Image.network(
                          'https://img.freepik.com/free-icon/star_318-704129.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: Mobile1.width(2, context),
                      ),
                      Text(
                        review1.voteAverage!.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: Mobile1.width(18, context)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Mobile1.width(20, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Mobile1.width(24, context),
                ),
                Text(
                  'Summary',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: Mobile1.width(24, context)),
                ),
              ],
            ),
            SizedBox(
              height: Mobile1.width(10, context),
            ),
            Row(
              children: [
                SizedBox(
                  width: Mobile1.width(40, context),
                ),
                SizedBox(
                  width: Mobile1.width(324, context),
                  child: Text(
                    review1.overview!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Mobile1.width(16, context)),
                    maxLines: read ? 2 : null,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                ref.read(readProvider.notifier).state =
                    !ref.read(readProvider.notifier).state;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    !read ? 'Read Less' : 'Read More',
                    style: TextStyle(
                        fontFamily: 'Brico',
                        color: Colors.red[300],
                        fontSize: Mobile1.width(17, context)),
                  ),
                  SizedBox(
                    width: Mobile1.width(20, context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Mobile1.width(30, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Mobile1.width(30, context),
                    ),
                    SizedBox(
                      height: Mobile1.width(8, context),
                    ),
                    Text(
                      'Watchlist',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: Mobile1.width(18, context)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: Mobile1.width(30, context),
                    ),
                    SizedBox(
                      height: Mobile1.width(8, context),
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(18, context)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Mobile1.width(30, context),
            ),
            Padding(
              padding: EdgeInsets.only(left: Mobile1.width(20, context)),
              child: Text(
                'Cast',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: Mobile1.width(26, context)),
              ),
            ),
            SizedBox(
              height: Mobile1.width(15, context),
            ),
            ref.watch(castProvider(review1.id!)).when(
                  data: (data) {
                    if (data == null) {
                      return const Text("Error Found");
                    }
                    return buildcast(context, read, data);
                  },
                  error: (error, stackTrace) => const Center(
                    child: Text("error"),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            SizedBox(
              height: Mobile1.width(30, context),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildcast(BuildContext context, bool read, CastModel data) {
    return SizedBox(
      height: Mobile1.width(120, context),
      child: ListView.separated(
          padding: EdgeInsets.only(left: Mobile1.width(20, context)),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                data.cast![index].profilePath == null
                    ? Icon(Icons.person)
                    : CircleAvatar(
                        radius: Mobile1.width(40, context),
                        backgroundImage: NetworkImage(ImageKey.imageTrend +
                            data.cast![index].profilePath!),
                      ),
                SizedBox(
                  height: Mobile1.width(10, context),
                ),
                Text(
                  data.cast![index].originalName!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Mobile1.width(17, context)),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: Mobile1.width(30, context),
              ),
          itemCount: data.cast!.length),
    );
  }
}
