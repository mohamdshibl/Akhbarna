
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/app_Cubit.dart';

import '../../cubit/app_States.dart';
import '../../widgets/widgets/componants.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News Search'
            ),
              foregroundColor: Colors.black
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(searchController.text);
                  },
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return 'search bar must not be empty';
                    }
                  },
                  label: 'search',
                  prifix: Icons.search_sharp,

                ),
              ),
              Expanded(
                  child: ConditionalBuilder(
                      condition: list.isNotEmpty,
                      builder: (context)=>ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            defaultSepartorContaner(),
                        itemCount: list.length,
                        itemBuilder: (context, index) =>
                            customListNews(list[index],context),
                      ) ,
                      fallback: (context)=>  const Center(
                         child: Text('Try Search Now',
                        style:TextStyle(fontSize: 25,color: Colors.green),
                         ),
                    ),
                  ),
              ),

              //
            ],
          ),
        );
      },
    );
  }
}
