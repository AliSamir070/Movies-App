import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/style/theme/theme_app.dart';
import '../../data/models/Movie.dart';

//for movie recommended
Widget movieRecommendedList(BuildContext context,
    String nameCategory
    ) {
  double sizeWidth = MediaQuery.of(context).size.width;
  double sizeHeight = MediaQuery.of(context).size.height;
  Movie movie = Movie();
  var cubit=AppCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nameCategory,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: sizeWidth * 1,
          height: sizeHeight * 0.30,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                decoration: BoxDecoration(
                    color: AppStyle.itemBackColor,
                    borderRadius: BorderRadiusDirectional.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${Constants.imageUrl}${movie.posterPath}",
                          height: sizeHeight * 0.20,
                          imageBuilder: (context, provider) {
                            return Container(
                              decoration: BoxDecoration(
                                  image:
                                  DecorationImage(image: provider, fit: BoxFit.cover),
                                  borderRadius:  const BorderRadiusDirectional.only(
                                      topStart:  Radius.circular(5),
                                      topEnd:  Radius.circular(5))),
                            );
                          },
                          placeholder: (context, url) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppStyle.bottomNavSelectedColor,
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                color: AppStyle.bottomNavSelectedColor,
                              ),
                            );
                          },
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //todo: function to add movie to watch list
                            },
                            child: const Image(
                              image: AssetImage('assets/images/add_to_watchlist.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Image(
                                image:  AssetImage('assets/images/star.png'),
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '7.7',
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'DeadPool 2',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                '2018',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'R',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '1h,22m',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 7);
            },
          ),
        )
      ],
    ),
  );
}


//to main movie in home screen
Widget mainMovie(
  BuildContext context, {
  required String pathPosterBg,
  required String pathPosterMovie,
  required String movieName,
  required String movieDate,
}) {
  double sizeHeight = MediaQuery.of(context).size.height;
  double sizeWidth = MediaQuery.of(context).size.width;
  var cubit = AppCubit.get(context);
  return Container(
    color: AppStyle.secondaryColor,
    child: Stack(
      children: [
        Image.asset(
          pathPosterBg,
          height: sizeHeight * 0.25,
          width: double.infinity,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        Positioned(
          height: sizeHeight * 0.20,
          left: sizeWidth * 0.02,
          bottom: sizeHeight * 0.01,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    pathPosterMovie,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                  Positioned(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            //todo: function to add movie to watch list
                          },
                          child: const Image(
                            image: AssetImage('assets/images/add_to_watchlist.png'),
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movieName,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movieDate,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}


//for two list view movie {recommended,new releases}
Widget movieNewReleasesList(BuildContext context,
    {required String nameCategory,
    required int countMovies,
    required String imagePathMovie}) {
  double sizeHeight = MediaQuery.of(context).size.height;
  double sizeWidth = MediaQuery.of(context).size.width;
  Movie movie =Movie();
  var cubit = AppCubit.get(context);
  return Container(
    color: AppStyle.canvasColor,
    padding: const EdgeInsets.all( 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nameCategory,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: sizeWidth * 1,
          height: sizeHeight * 0.24,
          child: ListView.separated(
            itemCount: countMovies,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    color: AppStyle.itemBackColor,
                    width: 130,
                    child: CachedNetworkImage(
                      imageUrl: "${Constants.imageUrl}${movie.posterPath}",
                      height: sizeHeight * 0.25,
                      imageBuilder: (context, provider) {
                        return Container(
                          decoration: BoxDecoration(
                              image:
                              DecorationImage(image: provider, fit: BoxFit.cover),
                              borderRadius:  const BorderRadiusDirectional.only(
                                  topStart:  Radius.circular(5),
                                  topEnd:  Radius.circular(5))),
                        );
                      },
                      placeholder: (context, url) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppStyle.bottomNavSelectedColor,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: AppStyle.bottomNavSelectedColor,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            //todo: function to add movie to watch list
                          },
                          child: const Image(
                            image: AssetImage('assets/images/add_to_watchlist.png'),
                          ),
                        ),
                      )),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 7);
            },
          ),
        ),
      ],
    ),
  );
}

