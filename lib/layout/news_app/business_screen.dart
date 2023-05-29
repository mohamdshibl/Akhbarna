import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/app_Cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../cubit/app_States.dart';
import '../../widgets/widgets/componants.dart';
import 'package:path/path.dart' as path;

class BusinessScreen extends StatelessWidget {
  //const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) =>
                  defaultSepartorContaner(),
              itemCount: list.length,
              itemBuilder: (context, index) =>
                  customListNews(list[index],context),
              //list[index]
            ) ,
            fallback: (context)=> const Center(child: CircularProgressIndicator())
        );
      },
    );
  }
}

