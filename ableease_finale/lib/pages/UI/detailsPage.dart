import 'package:ableeasefinale/pages/UI/homePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String name = "";
  DateTime? dateOfBirth;
  String dateForDisplay = "Date Of Birth";
  String selectedGender = "Select Gender"; // Default value for dropdown
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateOfBirth != null
        ? DateFormat('yyyy-MM-dd').format(dateOfBirth!)
        : "Date Of Birth";

    return Scaffold(
      body: Center(
        // Parent Container
        child: Container(
          width: 325,
          height: 470, // Increased height of the container
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0, // Decreased top padding
                  right: 40,
                  left: 40,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: nameController,
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            labelText: "Name",
                            fillColor: Theme.of(context).colorScheme.onPrimary,
                            hintText: "Enter Name",
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          validator: (name) =>
                              name!.isEmpty ? 'Please enter you name' : null),
                      const SizedBox(
                        height: 15, // Decreased height between input fields
                      ),
                      GestureDetector(
                        onTap: () async {
                          dateOfBirth = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1924),
                              lastDate: DateTime.now(),
                              initialDate: dateOfBirth ?? DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                    data: ThemeData().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        background: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        onSurface: const Color(0xffEA3EF7),
                                      ),
                                    ),
                                    child: child!);
                              });
                          setState(() {});
                        },
                        child: Container(
                          height: 64.5, // Decreased height of the container
                          width: 275,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12.5),
                                child: Icon(Icons.calendar_month),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.5),
                                child: Text(
                                  formattedDate,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15, // Decreased height between input fields
                      ),
                      Container(
                        height: 64.5, // Increased height of the container
                        width: 275,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 7, right: 20),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedGender,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ), // Added dropdown icon
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary), // Increased font size
                            underline: Container(
                              height: 0,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                            items: [
                              "Select Gender",
                              "Male",
                              "Female",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  alignment: Alignment
                                      .centerLeft, // Align text to the left
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20, // Decreased height between input fields
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your login logic here
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimary, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
