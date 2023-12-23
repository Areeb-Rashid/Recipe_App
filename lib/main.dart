import 'package:flutter/material.dart';
import 'package:recipe/navigate.dart';
import 'package:recipe/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
// Expanded(
//
//   child: ListView.builder(
//     shrinkWrap: true,
//       itemCount: recipies.length,
//       itemBuilder: (BuildContext context, index){
//
//         return Container(
//           margin: const EdgeInsets.only(bottom: 15),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(recipies[index].imageIurl),
//             ),
//             border: const Border.symmetric(),
//             borderRadius: const BorderRadius.all(Radius.circular(20)),
//           ),
//             child:
//             ListTile(
//                         title: Row(
//                           children: [
//                             Text(recipies[index].name),
//                             const SizedBox(width: 30),
//                             IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
//                           ],
//                         ),
//                         subtitle: Text('Ingredients = ${recipies[index].ingredients}'),
//
//                       ),
//
//
//         ) ;
//       }
//   ),
// )
