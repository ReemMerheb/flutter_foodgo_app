import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_foodgo/models/profile_model.dart'; 
import 'package:flutter_foodgo/widgets/profile_textfield.dart'; 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final userProfile = Provider.of<UserProfile>(context, listen: false);

    nameController = TextEditingController(text: userProfile.name);
    emailController = TextEditingController(text: userProfile.email);
    addressController = TextEditingController(text: userProfile.address);
    passwordController = TextEditingController(text: userProfile.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveProfile() {
    final userProfile = Provider.of<UserProfile>(context, listen: false);
    userProfile.updateProfile(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      password: passwordController.text,
    );
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfile>(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Container(color: Color.fromARGB(255, 255, 0, 0)),
          ),
          
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 110, 
                        height: 110, 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 0, 0), 
                            width: 2.0, 
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/profilepic.png'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userProfile.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      
                      ProfileTextField(
                        label: 'Name',
                        controller: nameController,
                        isEditing: isEditing,
                      ),
                      SizedBox(height: 20),
                      ProfileTextField(
                        label: 'Email',
                        controller: emailController,
                        isEditing: isEditing,
                      ),
                      SizedBox(height: 20),
                      ProfileTextField(
                        label: 'Delivery Address',
                        controller: addressController,
                        isEditing: isEditing,
                      ),
                      SizedBox(height: 20),
                      ProfileTextField(
                        label: 'Password',
                        controller: passwordController,
                        isEditing: isEditing,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      
                      isEditing
                          ? ElevatedButton.icon(
                              onPressed: saveProfile,
                              label: const Text('Save Profile', style: TextStyle(color: Colors.white)),
                              icon: const Icon(Icons.save_as_outlined, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                                backgroundColor: const Color.fromARGB(255, 57, 55, 56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          : ElevatedButton.icon(
                              onPressed: toggleEditMode,
                              icon: const Icon(Icons.edit, color: Colors.white),
                              label: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                                backgroundColor: const Color.fromARGB(255, 69, 66, 66),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                      
                      // Adding space between buttons
                      const SizedBox(height: 10),

                      if (isEditing)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                            });
                          },
                          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                            backgroundColor: Colors.transparent, // Use transparent for the Cancel button
                            elevation: 0, // Remove elevation
                          ),
                        ),

                      const SizedBox(height: 10), // Add padding between Cancel and Log out buttons

                      if (!isEditing)
                        ElevatedButton(
                          onPressed: () {
                            // Implement your logout logic here
                          },
                          child: const Text('Log out', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                            backgroundColor: const Color.fromARGB(255, 238, 1, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 25, 
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
          ),
          
          Positioned(
            top: 25, 
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white, size: 30),
              onPressed: () {
                // Implement settings logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
