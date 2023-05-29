import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_Cubit.dart';
import '../../cubit/app_States.dart';
import '../../widgets/widgets/componants.dart';

class SportScreen extends StatelessWidget {
  //const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit
            .get(context)
            .sports;

        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) =>
              ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    defaultSepartorContaner(),
                itemCount: list.length,
                itemBuilder: (context, index) =>
                    customListNews(list[index],context),
                //list[index]
              ),
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
