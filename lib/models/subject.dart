class Restaurants {
  String id;
  String Name;
  String Cuisines;
  String image;
  String imagebanner;
  Restaurants({required this.id, required this.Name, required
  this.Cuisines, required this.image, required this.imagebanner});

  Restaurants.fromMap(Map <String, dynamic> snapshot, String id) :
        id = id,
        Name = snapshot['Name'] ?? '',
        Cuisines = snapshot['Cuisines'] ?? '',
        image = snapshot['image'] ?? '',
        imagebanner = snapshot['imagebanner'] ?? '';
}
class Menus {
  String id;
  String Name;
  String Cuisines;
  String imagebanner;
  String image;
  Menus({required this.id, required this.Name, required
  this.Cuisines, required this.image, required this.imagebanner});

  Menus.fromMap(Map <String, dynamic> snapshot, String id) :
        id = id,
        Name = snapshot['Name'] ?? '',
        Cuisines = snapshot['Cuisines'] ?? '',
        imagebanner = snapshot['imagebanner'] ?? '',
        image = snapshot['image'] ?? '';
}
class Favourites {
  String id;
  String purpose;
  String mode;
  Favourites({required this.id, required
  this.purpose, required this.mode});

  Favourites.fromMap(Map <String, dynamic> snapshot, String id) :
        id = id,
        purpose = snapshot['purpose'] ?? '',
        mode = snapshot['mode'] ?? '';
}