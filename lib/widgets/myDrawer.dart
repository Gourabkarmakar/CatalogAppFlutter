import 'package:catalog_app/pallets/palates.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const currentimage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV_sFpDpeeVEbz6FWYWXIh3ziuYLP8WsC1rw&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: ListView(
          children: const [
            DrawerHeader(
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Anushree karmakar",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  accountEmail: Text(
                    "Admin@admin.com",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(currentimage),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
