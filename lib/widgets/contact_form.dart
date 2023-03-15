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
  final _formKey = GlobalKey<FormState>();

  bool validate() {
    //Validate Form Fields
    bool validate = _formKey.currentState?.validate() ?? false;
    if (validate) _formKey.currentState?.save();
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact - ${widget.index}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  //Clear All forms Data
                                  widget.contactModel.name = "";
                                  widget.contactModel.number = "";
                                  widget.contactModel.email = "";
                                  widget._nameController.clear();
                                  widget._contactController.clear();
                                  widget._emailController.clear();
                                });
                              },
                              child: const Text(
                                "Clear",
                                style: TextStyle(color: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () => widget.onRemove(),
                              child: const Text(
                                "Remove",
                                style: TextStyle(color: Colors.blue),
                              )),
                          Expanded(
                            child: TextFormField(
                              controller: widget._nameController,
                              // initialValue: widget.contactModel.name,
                              onChanged: (value) =>
                                  widget.contactModel.name = value,
                              onSaved: (value) =>
                                  widget.contactModel.name = value!,
                              validator: (value) =>
                                  value!.length > 3 ? null : "Enter Name",
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                border: OutlineInputBorder(),
                                hintText: "Enter Name",
                                labelText: "Name",
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: TextFormField(
                              controller: widget._contactController,
                              onChanged: (value) =>
                                  widget.contactModel.number = value,
                              onSaved: (value) =>
                                  widget.contactModel.name = value!,
                              validator: (value) => value!.length > 3
                                  ? null
                                  : "Number is Not Valid",
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                border: OutlineInputBorder(),
                                hintText: "Enter Number",
                                labelText: "Number",
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: TextFormField(
                              controller: widget._emailController,
                              onChanged: (value) =>
                                  widget.contactModel.email = value,
                              onSaved: (value) =>
                                  widget.contactModel.email = value!,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                                border: OutlineInputBorder(),
                                hintText: "Enter Email",
                                labelText: "Email",
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
