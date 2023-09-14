class Model {
  final int id;
  final String imagePath;
  final String name;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0, imagePath: 'assets/images/home.svg', name: 'Home'),
  Model(id: 1, imagePath: 'assets/images/salon.svg', name: 'Salons'),
  Model(id: 2, imagePath: 'assets/images/shopping.svg', name: 'Shopping'),
  Model(id: 3, imagePath: 'assets/images/user.svg', name: 'Profile'),
];
