import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_text_field.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  static const String routeName = '/add_user';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AddUserScreen(),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  late String name, email, phone;
  bool _passVisibility = true;
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> items = ['Swimming', 'Football', 'Programming'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(
        title: 'Add User',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'successful',
                      ),
                    ),
                  );
                  return;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'failed',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3css/img_avatar3.png',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.person, "Enter Your Name", "Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.email, "Enter Your Email", "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter E-mail ';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please Enter a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    obscureText: _passVisibility,
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      isDense: true,
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: _passVisibility
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          _passVisibility = !_passVisibility;
                          setState(() {});
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter Password';
                      } else if (value.length < 8) {
                        return 'Password Must have minimum 8 chars';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    left: 10,
                    right: 10,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        iconEnabledColor: Colors.black,
                        iconSize: 30,
                        decoration: buildInputDecoration(
                          Icons.interests,
                          'Interest',
                          'Interest',
                        ),
                        hint: const Text('Interest'),
                        items: items
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
