class FoodModel {
  final String name;
  final String category;
  final String description;
  final String price;
  final String imageUrl;

  FoodModel(
      {required this.name,
      required this.category,
      required this.description,
      required this.price,
      required this.imageUrl});
}

List<FoodModel> FoodList = [
  FoodModel(
      name: "marghrita Pizza",
      category: "Fast Food",
      description: "Pizza with cheese",
      price: "300",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/800px-Eq_it-na_pizza-margherita_sep2005_sml.jpg"),
  FoodModel(
      name: "pepperoni Pizza",
      category: "Fast Food",
      description: "Pizza with Chicken",
      price: "250",
      imageUrl:
          "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg"),
  FoodModel(
      name: "vegetarian Pizza",
      category: "Fast Food",
      description: "Pizza  for vetetarian",
      price: "120",
      imageUrl:
          "https://thumbs.dreamstime.com/z/beautiful-landscape-dry-tree-branch-sun-flowers-field-against-colorful-evening-dusky-sky-use-as-natural-background-backdrop-48319427.jpg"),
];
