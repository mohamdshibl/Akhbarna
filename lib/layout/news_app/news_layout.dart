import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/app_States.dart';
import 'package:newsapp/layout/news_app/search_screen.dart';

import '../../cubit/app_Cubit.dart';
import '../../widgets/widgets/componants.dart';

class NewsScreen extends StatelessWidget {
  // const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
                color: Colors.black,
              ),
            ],
          ),
          body: cubit.Screans[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndexBtmNav(index);
            },
            items: cubit.b,
          ),
        );
      },
    );
  }
}
