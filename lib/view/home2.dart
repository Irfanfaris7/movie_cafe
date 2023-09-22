import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/apiProvider.dart';
import 'package:movie_cafe/provider/provider.dart';
import 'package:movie_cafe/view/review2.dart';
import 'package:movie_cafe/view/review_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home2 extends ConsumerWidget {
  Home2({super.key});

  final carouselController = CarouselController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trending = ref.watch(trendingMovieProvider);

    final color1 =
        ref.read(colorProvider.notifier).state ? Colors.white : Colors.black;
    final color2 =
        ref.read(colorProvider.notifier).state ? Colors.black : Colors.white;

    final color4 =
        ref.read(colorProvider.notifier).state ? Colors.red[700] : Colors.white;

    final popular = ref.watch(popularProvider);
    final nowPlaying = ref.watch(nowPlayingProvider);
    final changeList = ref.watch(changeListProvider);
    final tv = ref.watch(tvProvider);
    final topRated = ref.watch(topRatedProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'MOVIE CAFE',
            style: TextStyle(
                fontFamily: "serif",
                color: color4,
                fontSize: Mobile1.width(30, context),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: Mobile1.width(70, context),
          backgroundColor: color1,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Mobile1.width(12, context)),
              child: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrsHoXv8g5_IrR-RlyqbS8GZDYmsRa23g1Nw&usqp=CAU'),
                  ),
                );
              }),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        backgroundColor: color1,
        drawer: NavigationDrawer(
          backgroundColor: ref.read(colorProvider.notifier).state
              ? Colors.black
              : Colors.white,
          children: [
            Column(
              children: [
                Container(
                  height: Mobile1.width(200, context),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.red[700]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Mobile1.width(25, context),
                      ),
                      CircleAvatar(
                        radius: Mobile1.width(40, context),
                        backgroundImage: const NetworkImage(
                            'https://www.masala.com/cloud/2023/02/03/WgbkAQfO-image.png'),
                      ),
                      SizedBox(
                        height: Mobile1.width(15, context),
                      ),
                      Text(
                        'Irfan Faris.k',
                        style: TextStyle(
                            color: ref.read(colorProvider.notifier).state
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: Mobile1.width(20, context)),
                      ),
                      Text(
                        'irfan@gmail.com',
                        style: TextStyle(
                            color: ref.read(colorProvider.notifier).state
                                ? Colors.black
                                : Colors.white,
                            fontSize: Mobile1.width(16, context)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Mobile1.width(8, context),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.movie_filter,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'Movies',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'Favourites',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.policy_rounded,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'Terms & Policy',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.chat,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'Chat with Us',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Mobile1.width(20, context)),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.red,
                      size: Mobile1.width(24, context),
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                          color: color1, fontSize: Mobile1.width(18, context)),
                    ),
                  ),
                ),
                SizedBox(
                  height: Mobile1.width(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mode',
                      style: TextStyle(
                          color: color1,
                          fontSize: Mobile1.width(22, context),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: Mobile1.width(10, context),
                    ),
                    Switch(
                      activeColor: Colors.red[700],
                      value: ref.watch(colorProvider),
                      onChanged: (value) {
                        ref.read(colorProvider.notifier).state =
                            !ref.read(colorProvider.notifier).state;
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        body: Builder(builder: (context) {
          return GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                print("object");
                Scaffold.of(context).openDrawer();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Mobile1.width(20, context),
                  ),
                  trending.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text('Error Found'),
                        );
                      }
                      return Column(
                        children: [
                          CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: data.results!.length,
                            itemBuilder: (context, index, realIndex) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewPage(
                                          review: data.results![index],
                                        ),
                                      ));
                                },
                                child: Container(
                                  width: Mobile1.width(195, context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Mobile1.width(10, context)),
                                    image: DecorationImage(
                                        image: NetworkImage(ImageKey
                                                .imageTrend +
                                            data.results![index].posterPath!),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                ref.read(smoothCurveProvider.notifier).state =
                                    index;
                              },
                              enlargeCenterPage: true,
                              height: Mobile1.width(275, context),
                              viewportFraction: .6,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                            ),
                          ),
                          SizedBox(
                            height: Mobile1.width(20, context),
                          ),
                          AnimatedSmoothIndicator(
                              onDotClicked: (index) {
                                ref.read(smoothCurveProvider.notifier).state =
                                    index;
                                carouselController.jumpToPage(
                                  index,
                                  // duration: const Duration(milliseconds: 400),
                                  // curve: Curves.linear,
                                );
                              },
                              effect: ScrollingDotsEffect(
                                dotWidth: Mobile1.width(9, context),
                                dotHeight: Mobile1.width(9, context),
                                dotColor: ref.watch(colorProvider)
                                    ? const Color.fromARGB(255, 235, 160, 160)
                                    : Colors.white,
                                activeDotColor:
                                    const Color.fromARGB(255, 239, 13, 13),
                                fixedCenter: true,
                              ),
                              activeIndex: ref.watch(smoothCurveProvider),
                              count: data.results!.length)
                        ],
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
                  SizedBox(
                    height: Mobile1.width(30, context),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Mobile1.width(10, context)),
                    height: Mobile1.width(50, context),
                    width: Mobile1.width(215, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            width: Mobile1.width(1.5, context),
                            color: const Color.fromARGB(255, 219, 29, 16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            ref.read(changeListProvider.notifier).state = true;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: Mobile1.width(40, context),
                            width: Mobile1.width(86, context),
                            decoration: BoxDecoration(
                                color: changeList
                                    ? Colors.red[700]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Popular',
                              style: TextStyle(
                                  fontFamily: 'Brico',
                                  color: color2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Mobile1.width(16, context)),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(changeListProvider.notifier).state = false;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: Mobile1.width(40, context),
                            width: Mobile1.width(94, context),
                            decoration: BoxDecoration(
                                color: changeList
                                    ? Colors.transparent
                                    : Colors.red[700],
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'Now Playing',
                              style: TextStyle(
                                  fontFamily: 'Brico',
                                  color: color2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Mobile1.width(16, context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(20, context),
                  ),
                  changeList
                      ? popular.when(
                          data: (data) {
                            if (data == null) {
                              return const Center(
                                child: Text('Error Found'),
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: Mobile1.width(15, context)),
                              child: SizedBox(
                                height: 295,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: data.results!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ReviewPage(
                                                  review: data.results![index]),
                                            ));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Mobile1.width(160, context),
                                            height: Mobile1.width(230, context),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://image.tmdb.org/t/p/w500${data.results![index].posterPath}'),
                                                  fit: BoxFit.cover),
                                            ),
                                            alignment: Alignment.bottomRight,
                                          ),
                                          SizedBox(
                                            height: Mobile1.width(10, context),
                                          ),
                                          Text(
                                            'Popularity : ${data.results![index].popularity}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Mobile1.width(14, context)),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: Mobile1.width(20, context),
                                  ),
                                ),
                              ),
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
                        )
                      : nowPlaying.when(
                          data: (data) {
                            if (data == null) {
                              return const Center(
                                child: Text('Error Found'),
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: Mobile1.width(15, context)),
                              child: SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: data.results!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ReviewPage(
                                                  review: data.results![index]),
                                            ));
                                      },
                                      child: Container(
                                          width: Mobile1.width(160, context),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500${data.results![index].posterPath}'),
                                                fit: BoxFit.cover),
                                          ),
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Mobile1.width(6, context)),
                                            child: CircularPercentIndicator(
                                              radius: 20,
                                              lineWidth: 3,
                                              progressColor: Colors.red,
                                              percent: data.results![index]
                                                      .voteAverage! /
                                                  10,
                                              center: Text(
                                                '${data.results![index].voteAverage}',
                                                style: TextStyle(
                                                    fontSize: Mobile1.width(
                                                        15, context),
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: Mobile1.width(20, context),
                                  ),
                                ),
                              ),
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
                  SizedBox(
                    height: Mobile1.width(40, context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Mobile1.width(15, context)),
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(
                          fontFamily: 'Brico',
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(20, context)),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(15, context),
                  ),
                  ref.watch(comingsoonProvider).when(
                        data: (data) {
                          if (data == null) {
                            return const Center(
                              child: Text('Error Found'),
                            );
                          }
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Mobile1.width(10, context)),
                            child: CarouselSlider.builder(
                                itemCount: data.results!.length,
                                itemBuilder: (context, index, realIndex) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReviewPage(
                                                review: data.results![index]),
                                          ));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: Mobile1.width(200, context),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Mobile1.width(20, context)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500${data.results![index].backdropPath ?? data.results![index].posterPath}'),
                                                fit: BoxFit.fitWidth),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Mobile1.width(10, context),
                                        ),
                                        SizedBox(
                                          width: Mobile1.width(200, context),
                                          child: Center(
                                            child: Text(
                                              '${data.results![index].title}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: Mobile1.width(
                                                      16, context)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: Mobile1.width(250, context),
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                )),
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
                  SizedBox(
                    height: Mobile1.width(40, context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Mobile1.width(15, context)),
                    child: Text(
                      'Top Rated',
                      style: TextStyle(
                          fontFamily: 'Brico',
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(20, context)),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(15, context),
                  ),
                  topRated.when(
                    data: (data) {
                      if (data == null) {
                        const Center(
                          child: Text('Error Found'),
                        );
                      }
                      return Padding(
                        padding:
                            EdgeInsets.only(left: Mobile1.width(15, context)),
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data!.results!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewPage(
                                            review: data.results![index]),
                                      ));
                                },
                                child: Container(
                                    width: Mobile1.width(160, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${data.results![index].backdropPath}'),
                                          fit: BoxFit.cover),
                                    ),
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: Mobile1.width(6, context)),
                                      child: CircularPercentIndicator(
                                        radius: 20,
                                        lineWidth: 3,
                                        progressColor: Colors.red,
                                        percent:
                                            data.results![index].voteAverage! /
                                                10,
                                        center: Text(
                                          '${data.results![index].voteAverage}',
                                          style: TextStyle(
                                              fontSize:
                                                  Mobile1.width(15, context),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: Mobile1.width(20, context),
                            ),
                          ),
                        ),
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
                  SizedBox(
                    height: Mobile1.width(40, context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Mobile1.width(15, context)),
                    child: Text(
                      'TV/Series',
                      style: TextStyle(
                          fontFamily: 'Brico',
                          color: color2,
                          fontWeight: FontWeight.w500,
                          fontSize: Mobile1.width(20, context)),
                    ),
                  ),
                  SizedBox(
                    height: Mobile1.width(15, context),
                  ),
                  tv.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text('Error Found'),
                        );
                      }
                      return Padding(
                        padding:
                            EdgeInsets.only(left: Mobile1.width(15, context)),
                        child: SizedBox(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.results!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewPage2(
                                            review1: data.results![index]),
                                      ));
                                },
                                child: Container(
                                  width: Mobile1.width(130, context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${data.results![index].posterPath}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: Mobile1.width(20, context),
                            ),
                          ),
                        ),
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
                  SizedBox(
                    height: Mobile1.width(30, context),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
