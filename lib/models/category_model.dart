class CategoryModel {
  String id;
  String image;
  String label;

  CategoryModel({required this.id, required this.label, required this.image});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "general",
        label: "General",
        image: "assets/images/general.png",
      ),

      CategoryModel(
        id: "business",
        label: "Business",
        image: "assets/images/busniess.png",
      ),
      CategoryModel(
        id: "entertainment",
        label: "Entertainment",
        image: "assets/images/entertainment.png",
      ),
      CategoryModel(
        id: "health",
        label: "Health",
        image: "assets/images/helth.png",
      ),
      CategoryModel(
        id: "science",
        label: "Science",
        image: "assets/images/science.png",
      ),
      CategoryModel(
        id: "technology",
        label: "Technology",
        image: "assets/images/technology.png",
      ),
      CategoryModel(
        id: "sports",
        label: "Sports",
        image: "assets/images/sport.png",
      ),
    ];
  }
}
