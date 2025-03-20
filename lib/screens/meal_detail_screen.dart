import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
      ),
    );
  }

  _createSectionContainer(Widget child) {
    return Container(
      height: 200,
      width: 330,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes da Refeição"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity, // Ocupa toda a largura maxima
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, "Ingredientes"),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  },
                ),
              ),
              _createSectionTitle(context, "Passos"),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 187, 181, 181),
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(meal.title);
                  },
                  child: const Text("Voltar"),
                ),
              )
            ],
          ),
        ));
  }
}
