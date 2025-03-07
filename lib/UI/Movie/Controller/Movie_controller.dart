import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myott/UI/TvSeries/TvSeries_details_page.dart';
import '../../../Data/movies_data.dart';
import '../../../Services/MovieService.dart';
import '../../Model/Moviesmodel.dart';
import '../Model/movie_details_model.dart';
import '../Model/movie_model.dart';

class MovieController extends GetxController {
  final MoviesService moviesService;
  MovieController(this.moviesService);

  var movieDetails =Rxn<MovieDetailsModel>();
  var isLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchMovieDetails(int movieId)async{
    try {
      isLoading(true);

      var fetchMovieDetials=await moviesService.getMovieDetails(movieId);
      movieDetails.value = fetchMovieDetials;


    } on Exception catch (e) {
      // TODO
    }finally{
      isLoading(false);
    }

  }

}
