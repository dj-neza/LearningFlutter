import 'package:flutter/material.dart';
import '../pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListItem(
      BuildContext context, String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(8, 56, 8, 16),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 24),
          buildListItem(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListItem(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
          Divider(),
        ],
      ),
    );
  }
}
