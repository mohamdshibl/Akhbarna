
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:newsapp/layout/news_app/web_view.dart';

Widget customListNews (articles,context){
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScrean("${articles['url']}"));
    },
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow:
        const [
          BoxShadow(
          color: Colors.black,
          blurRadius: 3,
        ),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              /// image
             image:  DecorationImage(
               image: NetworkImage('${articles['urlToImage']}'),
               fit: BoxFit.cover,
             ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 8,),
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            /// source auther
            child: Text('${articles['author']}'),
          ),
          SizedBox(height: 8,),
          /// title
           Text('${articles['title']}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    ),
  );
}

Widget defaultSepartorContaner() {
  return Container(
    width: double.infinity,
    height: 4,
    color: Colors.grey[300],
  );
}



Widget defaultButton({
  double width =double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,

}) => Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: (){
      function;
    },
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);


Widget defaultFormField({
  required TextEditingController controller,
  double width =double.infinity,
  // Color background = Colors.grey,
  required TextInputType type,
  String? text,
  required Function validate,
  required String label,
  required IconData prifix,
  //Function? onSubmit ,
  //Function? onChange ,
  VoidCallback? onTap,
  required Function onChange,

}) => TextFormField(
  controller : controller,
  keyboardType: type,
  //onFieldSubmitted:  (value) => onSubmit!(value),
  onChanged: (value) => onChange!(value),
  onTap: onTap,
  validator: (value) => validate(value),
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prifix),
    border: OutlineInputBorder(),
  ),
);


void navigateTo(context,@required Widget){
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=> Widget )
  );

}
// TextField(
// decoration: InputDecoration.collapsed(
// hintText: 'Search....',
//
// ),
// ),


// Widget buildTaskItem(Map model,context) => Column(
//   children: [
//     Dismissible(
//       key: Key(model['id'].toString()),
//       onDismissed: (d){
//         AppCubit.get(context).deleteDataFromDatabase(model['id']);
//         var snackBar = const SnackBar(content: Text('you deleted this task'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         print('deleted');
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.blue[50],
//         ),
//         child: ListTile(
//
//           leading:IconButton(
//             icon: const Icon(Icons.check_box,color: Colors.green,),
//             onPressed: () {
//               AppCubit.get(context).updateDataFromDatabase('done',model['id']);
//               var snackBar = const SnackBar(content: Text('This task went to done tasks Screen'));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             },
//           ),
//           /// title
//           title:Text(
//               '${model['title']}',
//               style: const TextStyle
//                 (fontSize: 20, fontWeight: FontWeight.bold,)),
//           /// time
//           subtitle:
//           Text(
//               '${model['date']}',
//               style: const TextStyle
//                 (fontSize: 16,)),
//           /// date
//           trailing: Column(
//             children: [
//               Text(
//                 '${model['time']}',
//                 style: const TextStyle
//                   (fontSize: 16, color:Colors.brown),),
//               Expanded(
//                 child: IconButton(
//                   onPressed:(){
//                     AppCubit.get(context).updateDataFromDatabase('archived',model['id']);
//                     var snackBar = const SnackBar(content: Text('This task went to done Archived Screen'));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   } ,
//                   icon: Icon(Icons.archive_outlined,color: Colors.black54,),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// );


