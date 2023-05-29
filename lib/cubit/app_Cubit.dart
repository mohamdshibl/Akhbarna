import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/app_States.dart';
import 'package:path/path.dart' as path;
import '../Shared/remote/dio_helper.dart';
import '../layout/news_app/Settings_Screen.dart';
import '../layout/news_app/business_screen.dart';
import '../layout/news_app/science_screen.dart';
import '../layout/news_app/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  List<Widget> Screans = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> b = const[
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ] ;



  void changeIndexBtmNav(int index) {
    currentIndex = index;
    if (index==1){
      getSports();
    }else if (index==2){
      getScience();
    }
    emit(NewsNtmNavState());
  }

  List<dynamic> business= [];

  void getBusiness(){
    emit(NewsGetLoadingsState());

    if (business.length==0){
      DioHelper.getData(url: 'v2/everything',
        query: {
          // 'country' : 'eg',
          'q': 'business',
          'apikey': '70fc99e5aa134da18090f67d8f442dec',
          // 65f7f556ec76449fa7dc7c0069f040ca
          //85cb973559e0433e96d8514961fd36e5
        },
      ).then((value) {
        // print(value.data.toString());
        business = value.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(NewsGetBusinessErrorState(e.toString()));
      })
      ;
    }else{
      emit(NewsGetBusinessSuccessState());
    }

  }

  List<dynamic> sports= [];
  void getSports(){
    emit(NewsGetLoadingsState());
    if (sports.length==0){
      DioHelper.getData(url: 'v2/everything',
        query: {
          // 'country' : 'eg',
          'q': 'sports',
          'apikey': '70fc99e5aa134da18090f67d8f442dec',
          // 65f7f556ec76449fa7dc7c0069f040ca
          //85cb973559e0433e96d8514961fd36e5
        },
      ).then((value) {
        // print(value.data.toString());
        sports = value.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(NewsGetBusinessErrorState(e.toString()));
      })
      ;
    }else{
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> science= [];
  void getScience(){
    emit(NewsGetLoadingsState());
    if (science.length==0){
      DioHelper.getData(url: 'v2/everything',
        query: {
          // 'country' : 'eg',
          'q': 'science',
          'apikey': '70fc99e5aa134da18090f67d8f442dec',
          // 65f7f556ec76449fa7dc7c0069f040ca
          //85cb973559e0433e96d8514961fd36e5
        },
      ).then((value) {
        // print(value.data.toString());
        science = value.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(NewsGetBusinessErrorState(e.toString()));
      })
      ;
    }else{
      emit(NewsGetBusinessSuccessState());
    }
  }
  List<dynamic> search= [];
  void getSearch(String value) {
    search= [];
    emit(NewsGetLoadingsState());

      DioHelper.getData(url: 'v2/everything',
        query: {
          // 'country' : 'eg',
          'q': value,
          'apikey': '70fc99e5aa134da18090f67d8f442dec',
          // 65f7f556ec76449fa7dc7c0069f040ca
          //85cb973559e0433e96d8514961fd36e5
        },
      ).then((value) {
        // print(value.data.toString());
        search = value.data['articles'];
        //  print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetBusinessErrorState(e.toString()));
      });



  }
  }




