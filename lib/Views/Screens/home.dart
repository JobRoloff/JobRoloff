
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';
import '../util_widgets/l_drawer.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final title;
  
  @override
  State <HomePage> createState() => _LoggedInHomePageState();
}
class _LoggedInHomePageState extends State <HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), 
      drawer: LDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card(
            //   child: InkWell(
            //     splashColor: Colors.blue.withAlpha(30),
            //     onTap: () {
            //       debugPrint('Card tapped.');
            //     },
            //     child: SizedBox(
            //       width: 150,
            //       height: 150,
            //       child: Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const SizedBox(
            //               height: 50,
            //               width: 50,
            //               child: DecoratedBox(
            //               decoration: BoxDecoration(
            //                 color: Colors.red
            //               ),
            //               ),
            //             ),                  
            //               Center( 
            //                 child:
            //                   ListTile(
            //                     title: Text('name'),
            //                     trailing: IconButton(
            //                       icon: Icon(Icons.menu_rounded), 
            //                       onPressed: () {
                                    
            //                       },
            //                     ),
            //                   ),
            //                 // Text(InventoryProvider.currentSum.toString()),
            //               ),
            //             ],                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: 
      LBottomNav()
    );
  }
}
