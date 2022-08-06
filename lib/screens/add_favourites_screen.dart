import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddFavouritesScreen extends StatefulWidget {
  static String routeName = '/add-favourites';

  @override
  State<AddFavouritesScreen> createState() => _AddFavouritesScreenState();
}

class _AddFavouritesScreenState extends State<AddFavouritesScreen> {
  var form = GlobalKey<FormState>();

  String? purpose;

  String? mode;

  void saveForm () {
    bool isValid = form.currentState!.validate();

    form.currentState!.save();
    print(purpose);
    print(mode);

    FirestoreService fsService = FirestoreService();
    fsService.addFavourites(purpose, mode);

    //hides keyboard
    FocusScope.of(context).unfocus();

    //resets form
    form.currentState!.reset();

    //shows a snackbar (popup)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Favourites added successfully!'),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To Favourites'),
        actions: [
          IconButton( onPressed: (){ saveForm();}, icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: form,
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  label: const Text('Restaurants'),
                ),
                items: [
                  const DropdownMenuItem(child: Text('Genki Sushi'), value: 'genki sushi'),
                  const DropdownMenuItem(child: Text('Thai Dynasty'), value: 'thai dynasty'),
                  const DropdownMenuItem(child: const Text('Shake Shack'), value: 'shake shack'),
                  const DropdownMenuItem(child: const Text('Starbucks'), value: 'starbucks'),
                  const DropdownMenuItem(child: const Text('Koi'), value: 'koi'),
                  const DropdownMenuItem(child: const Text('Astons Specialties'), value: 'astons specialties'),
                ],
                validator: (value){
                  if(value == null){
                    return "Please Provide a restaurant.";
                  } else{
                    return null;
                  }
                },
                onChanged: (value) { mode = value as String;},
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Label')),
                validator: (value){
                  if(value == null){
                    return "Please Provide a label";
                  } else if (value.length < 5){
                    return "Please enter a description that is minimally 5 characters.";
                  } else{
                    return null;
                  }
                },
                onSaved: (value) {purpose = value;},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
