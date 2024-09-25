import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 203, 106)),
  ));
}
class Recipe {
  final String name;
  final String ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

List<Recipe> recipes = [
  Recipe(
    name: "Coconut Lemonade",
    ingredients: "4 limes, 5 tbsp sugar, 4 cups water, 1/2 coconut milk, ice",
    instructions: "1. Put ingredients in cup\n2. Blend\n3. Serve",
  ),
  Recipe(
    name: "Peanut Butter Cookies",
    ingredients: "1 cup peanut butter, 1/2 cup sugar, 1 egg",
    instructions: "1. Combine ingredients\n2. Bake on 400\n3. Serve",
  ),
  Recipe(
    name: "Teriyaki Chicken",
    ingredients: "2lb chicken wings, 1 cup soy sauce, 1/2 cup brown sugar",
    instructions: "1. Combine sauce ingredients\n2. Pour over wings\n3. Bake on high",
  ),
  Recipe(
    name: "Banana Oat Smoothie",
    ingredients: "1 cup oats, 1 banana, 1 cup milk",
    instructions: "1. Combine ingredients\n2. Blend\n3. Serve",
  ),
  Recipe(
    name: "Pancakes",
    ingredients: "1 banana, 2 eggs, 1/4 tsp cinnamon, honey to serve",
    instructions: "1. Combine ingredients\n2. Pour batter into pan\n3. Cook until golden",
  ),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipePage(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class RecipePage extends StatelessWidget {
  final Recipe recipe;

  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(recipe.ingredients),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}