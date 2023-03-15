import 'package:dynamic_forms/widgets/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///  Created by mac on 15/3/23.
class DynamicContactForms extends StatelessWidget {
  List<ContactForm> contactForms = List.empty(growable: true);

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
          // onAdd();
        },
      ),
      body: contactForms.isNotEmpty
          ? ListView.builder(
              itemCount: contactForms.length,
              itemBuilder: (_, index) {
                return contactForms[index];
              })
          : const Center(child: Text("Tap on + to Add Contact")),
    );
  }
}
