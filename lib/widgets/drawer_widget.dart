import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 178, 196),
            ),
            //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 231, 178, 196)),
              accountName: Text(
                "Zeynep Kılıç",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("18zeynepklc@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: Padding(
                padding: EdgeInsets.only(bottom: 9.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 150, 88, 138),
                  child: Text(
                    "Z",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text(' Shop by Categories '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text(' My Orders '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text(' Go Premium '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text(' Favourites '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text(' FAQs '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text(' Addresess '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text(' Saved Cards '),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text(' Terms & Conditions '),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
