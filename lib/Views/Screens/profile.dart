import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';
import '../util_widgets/l_drawer.dart';
import '../util_widgets/light_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: LDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // children: [
                //   Row(
                //     children: <Widget>[
                //       Container(
                //         child: const Text('good ole bio'),
                //         margin: EdgeInsets.fromLTRB(20, 8, 8, 16),
                //         width: MediaQuery.of(context).size.width * 0.42,
                //         height: 90,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(4)),
                //             shape: BoxShape.rectangle,
                //             border: Border.all(
                //               color: Colors.blue,
                //               width: 4,
                //             )
                //         ),
                //       ),
                //     ],
                //   ),
                // ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'bio',
                ),
              ),
            ),
            const LightSwitch(),
          ],
        ),
        
      ),
      bottomNavigationBar: LBottomNav()
    );
  
  }
}

