import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_cafe/Model/movie_model.dart';
import 'package:movie_cafe/class/responsive.dart';
import 'package:movie_cafe/provider/apiProvider.dart';
import 'package:movie_cafe/provider/provider.dart';
import 'package:movie_cafe/view/review_page.dart';

class Search extends ConsumerWidget {
  Search({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(searchProvider);

    final color1 =
        ref.read(colorProvider.notifier).state ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: color1,
      body: Column(
        children: [
          SizedBox(
            height: Mobile1.height(60, context),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Mobile1.width(10, context)),
            child: Center(
              child: SizedBox(
                width: Mobile1.width(350, context),
                height: Mobile1.width(50, context),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    ref.read(movienameProvider.notifier).state = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 7, 33, 54),
                    hintText: 'Search movies',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Mobile1.width(16, context)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Mobile1.width(10, context)),
                        borderSide: BorderSide(
                            width: Mobile1.width(1.5, context),
                            color: const Color.fromARGB(255, 233, 40, 26))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Mobile1.width(10, context)),
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                    prefixIconColor: Colors.white,
                    suffixIcon: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Mobile1.width(30, context),
          ),
          Expanded(
            child: item.when(
              data: (data) => searchmovies(context, data!, ref),
              error: (error, stackTrace) => const Text("error"),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox searchmovies(BuildContext context, MovieModel data, WidgetRef ref) {
    final color2 =
        ref.read(colorProvider.notifier).state ? Colors.black : Colors.white;
    return SizedBox(
      height: Mobile1.width(100, context),
      child: ListView.separated(
        itemCount: data.results!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Mobile1.width(30, context)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReviewPage(review: data.results![index]),
                    ));
              },
              child: Row(
                children: [
                  data.results![index].posterPath == null
                      ? SizedBox(
                          height: Mobile1.width(150, context),
                          width: Mobile1.width(100, context),
                          child: Icon(
                            Icons.person_2_outlined,
                            color: color2,
                            size: Mobile1.width(30, context),
                          ),
                        )
                      : Container(
                          height: Mobile1.width(150, context),
                          width: Mobile1.width(100, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(ImageKey.imageTrend +
                                      data.results![index].posterPath!),
                                  fit: BoxFit.cover),
                              color: Colors.yellow),
                        ),
                  SizedBox(width: Mobile1.width(20, context)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Mobile1.width(180, context),
                        child: Text(
                          data.results![index].title!,
                          style: TextStyle(
                              fontFamily: 'serif',
                              fontWeight: FontWeight.w500,
                              color: color2,
                              fontSize: Mobile1.width(24, context)),
                        ),
                      ),
                      SizedBox(height: Mobile1.width(10, context)),
                      Row(
                        children: [
                          SizedBox(
                            width: Mobile1.width(20, context),
                            child: Image.network(
                              'https://img.freepik.com/free-icon/star_318-704129.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: Mobile1.width(2, context),
                          ),
                          Text(
                            data.results![index].voteAverage!.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: color2,
                                fontSize: Mobile1.width(18, context)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: Mobile1.width(20, context),
        ),
      ),
    );
  }
}
