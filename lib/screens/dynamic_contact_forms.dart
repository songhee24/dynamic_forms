import 'package:dynamic_forms/models/contact_model.dart';
import 'package:dynamic_forms/widgets/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///  Created by mac on 15/3/23.
class DynamicContactForms extends StatefulWidget {
  @override
  State<DynamicContactForms> createState() => _DynamicContactFormsState();
}

class _DynamicContactFormsState extends State<DynamicContactForms> {
  final List<ContactForm> _contactForms = List.empty(growable: true);

  onAdd() {
    setState(() {
      ContactModel contactModel = ContactModel(id: _contactForms.length);
      _contactForms.add(
        ContactForm(
          index: _contactForms.length,
          contactModel: contactModel,
          onRemove: () {},
        ),
      );
    });
  }

  onRemove(ContactModel contact) {
    setState(() {
      int index = _contactForms
          .indexWhere((element) => element.contactModel.id == contact.id);
      _contactForms.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Dynamic Contacts"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            // onSave();
          },
          child: const Text("Save"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          onAdd();
        },
      ),
      body: _contactForms.isNotEmpty
          ? ListView.builder(
              itemCount: _contactForms.length,
              itemBuilder: (_, index) {
                return _contactForms[index];
              })
          : const Center(child: Text("Tap on + to Add Contact")),
    );
  }
}
