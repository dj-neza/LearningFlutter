import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/details';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsPage(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContentCard(BuildContext context, Widget child) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        height: 200,
        width: 300,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContentCard(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContentCard(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId)
            ? Icons.star_rounded
            : Icons.star_border_rounded),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
