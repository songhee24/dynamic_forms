import 'package:dynamic_forms/models/contact_model.dart';
import 'package:flutter/material.dart';

///  Created by mac on 15/3/23.
class ContactForm extends StatefulWidget {
  ContactForm(
      {super.key,
      required this.index,
      required this.contactModel,
      required this.onRemove});

  final int index;
  final ContactModel contactModel;
  final Function onRemove;
  final state = _ContactFormState();

  @override
  _ContactFormState createState() => _ContactFormState();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isValidated() => state.validate();
}

class _ContactFormState extends State<ContactForm> {
  bool validate() {
    //Validate Form Fields
    // bool validate = formKey.currentState.validate();
    // if (validate) formKey.currentState.save();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
