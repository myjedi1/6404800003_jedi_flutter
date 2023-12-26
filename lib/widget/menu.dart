import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/homeStack.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.face),
            accountName: Text('Jedi Phatsarat'),
            accountEmail: Text('myjedi1@gmail.com'),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border),
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/space.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.arrow_right),
            selected:
                ModalRoute.of(context)?.settings.name == ('homestack/home')
                    ? true
                    : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.square),
            title: Text('Products'),
            trailing: Icon(Icons.arrow_right),
            selected:
                ModalRoute.of(context)?.settings.name == ('productstack/product')
                    ? true
                    : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.feed),
            title: Text('News'),
            selected:
                ModalRoute.of(context)?.settings.name == 'newsStack/news'
                    ? true
                    : false,
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/newsStack', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
