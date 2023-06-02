import 'package:dialog_service/dialog_service.dart';
import 'package:flutter/material.dart';

class ContactBottomSheet extends AppBottomSheet {
  @override
  Widget build() {
    return const ContactListWidget();
  }
}

class Contact {
  final String name;
  final String mobileNo;

  const Contact(this.name, this.mobileNo);
}

const List<Contact> contactList = [
  Contact("John Doe", "017777777777"),
  Contact("Kohn Eoe", "017777777777"),
  Contact("Lohn Foe", "017777777777"),
  Contact("Mohn Goe", "017777777777"),
  Contact("Nohn Hoe", "017777777777"),
  Contact("Qohn Ioe", "017777777777"),
];

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(contactList[index].name),
        subtitle: Text(contactList[index].mobileNo),
        onTap: () => Navigator.of(context).pop(contactList[index]),
      ),
    );
  }
}
