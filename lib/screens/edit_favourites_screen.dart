import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../services/firestore_service.dart';

class EditFavouritesScreen extends StatefulWidget {
  static String routeName = '/edit-favourites';

  @override
  State<EditFavouritesScreen> createState() => _EditFavouritesScreenState();
}

class _EditFavouritesScreenState extends State<EditFavouritesScreen> {
  var form = GlobalKey<FormState>();

  String? purpose;

  String? mode;

  void saveForm (String id) {
    bool isValid = form.currentState!.validate();

    form.currentState!.save();
    print(purpose);
    print(mode);

    FirestoreService fsService = FirestoreService();
    fsService.editFavourites(id, purpose, mode);

    //hides keyboard
    FocusScope.of(context).unfocus();

    //resets form
    form.currentState!.reset();

    //shows a snackbar (popup)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Favourites updated successfully!'),));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Favourites selectedExpense = ModalRoute.of(context)?.settings.arguments as
    Favourites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Favourites'),
        actions: [
          IconButton( onPressed: (){ saveForm(selectedExpense.id);}, icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: form,
          child: Column(
            children: [
              DropdownButtonFormField(
                value: selectedExpense.mode,
                decoration: InputDecoration(
                  label: Text('Restaurants'),
                ),
                items: [
                  DropdownMenuItem(child: Text('Genki Sushi'), value: 'genkisushi'),
                  DropdownMenuItem(child: Text('Thai Dynasty'), value: 'thaidynasty'),
                  DropdownMenuItem(child: Text('Shake Shack'), value: 'shakeshack'),
                  DropdownMenuItem(child: Text('Starbucks'), value: 'starbucks'),
                  DropdownMenuItem(child: Text('Koi'), value: 'koi'),
                  DropdownMenuItem(child: Text('Astons Specialties'), value: 'astonsspecialties'),
                ],
                onChanged: (value) { mode = value as String;},
                onSaved: (value) { mode = value as String; },
              ),
              TextFormField(
                initialValue: selectedExpense.purpose,
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
