// import 'dart:io';

// import 'package:flushfood/consts/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

// class SignUpScreen extends StatefulWidget {
//   static const routeName = '/SignUpScreen';
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final FocusNode _passwordFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _phoneNumberFocusNode = FocusNode();
//   bool _obscureText = true;
//   String _emailAddress = '';
//   String _password = '';
//   String _fullName = '';
//   int _phoneNumber;
//   File _pickedImage;
//   final _formKey = GlobalKey<FormState>();
//   @override
//   void dispose() {
//     _passwordFocusNode.dispose();
//     _emailFocusNode.dispose();
//     _phoneNumberFocusNode.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     final isValid = _formKey.currentState.validate();
//     FocusScope.of(context).unfocus();
//     if (isValid) {
//       _formKey.currentState.save();
//     }
//   }

//   void _pickImageCamera() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: ImageSource.camera);
//     final pickedImageFile = File(pickedImage.path);
//     setState(() {
//       _pickedImage = pickedImageFile;
//     });
//     Navigator.pop(context);
//   }

//   void _pickImageGallery() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.getImage(source: ImageSource.gallery);
//     final pickedImageFile = File(pickedImage.path);
//     setState(() {
//       _pickedImage = pickedImageFile;
//     });
//     Navigator.pop(context);
//   }

//   void _remove() {
//     setState(() {
//       _pickedImage = null;
//     });
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.95,
//             child: RotatedBox(
//               quarterTurns: 2,
//               child: WaveWidget(
//                 config: CustomConfig(
//                   gradients: [
//                     [ColorsConsts.gradiendFStart, ColorsConsts.gradiendLStart],
//                     [ColorsConsts.gradiendFEnd, ColorsConsts.gradiendLEnd],
//                   ],
//                   durations: [19440, 10800],
//                   heightPercentages: [0.20, 0.25],
//                   blur: MaskFilter.blur(BlurStyle.solid, 10),
//                   gradientBegin: Alignment.bottomLeft,
//                   gradientEnd: Alignment.topRight,
//                 ),
//                 waveAmplitude: 0,
//                 size: Size(
//                   double.infinity,
//                   double.infinity,
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//                     child: CircleAvatar(
//                       radius: 71,
//                       backgroundColor: ColorsConsts.gradiendLEnd,
//                       child: CircleAvatar(
//                         radius: 65,
//                         backgroundColor: ColorsConsts.gradiendFEnd,
//                         backgroundImage: _pickedImage == null
//                             ? null
//                             : FileImage(_pickedImage),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       top: 120,
//                       left: 110,
//                       child: RawMaterialButton(
//                         elevation: 10,
//                         fillColor: ColorsConsts.gradiendLEnd,
//                         child: Icon(Icons.add_a_photo),
//                         padding: EdgeInsets.all(15.0),
//                         shape: CircleBorder(),
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text(
//                                     'Choose option',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         color: ColorsConsts.gradiendLStart),
//                                   ),
//                                   content: SingleChildScrollView(
//                                     child: ListBody(
//                                       children: [
//                                         InkWell(
//                                           onTap: _pickImageCamera,
//                                           splashColor: Colors.purpleAccent,
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Icon(
//                                                   Icons.camera,
//                                                   color: Colors.purpleAccent,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 'Camera',
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: ColorsConsts.title),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: _pickImageGallery,
//                                           splashColor: Colors.purpleAccent,
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Icon(
//                                                   Icons.image,
//                                                   color: Colors.purpleAccent,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 'Gallery',
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: ColorsConsts.title),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: _remove,
//                                           splashColor: Colors.purpleAccent,
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Icon(
//                                                   Icons.remove_circle,
//                                                   color: Colors.red,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 'Remove',
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.red),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               });
//                         },
//                       ))
//                 ],
//               ),
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: TextFormField(
//                           key: ValueKey('name'),
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'name cannot be null';
//                             }
//                             return null;
//                           },
//                           textInputAction: TextInputAction.next,
//                           onEditingComplete: () => FocusScope.of(context)
//                               .requestFocus(_emailFocusNode),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                               border: const UnderlineInputBorder(),
//                               filled: true,
//                               prefixIcon: Icon(Icons.person),
//                               labelText: 'Full name',
//                               fillColor: Theme.of(context).backgroundColor),
//                           onSaved: (value) {
//                             _fullName = value;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: TextFormField(
//                           key: ValueKey('email'),
//                           focusNode: _emailFocusNode,
//                           validator: (value) {
//                             if (value.isEmpty || !value.contains('@')) {
//                               return 'Please enter a valid email address';
//                             }
//                             return null;
//                           },
//                           textInputAction: TextInputAction.next,
//                           onEditingComplete: () => FocusScope.of(context)
//                               .requestFocus(_passwordFocusNode),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                               border: const UnderlineInputBorder(),
//                               filled: true,
//                               prefixIcon: Icon(Icons.email),
//                               labelText: 'Email Address',
//                               fillColor: Theme.of(context).backgroundColor),
//                           onSaved: (value) {
//                             _emailAddress = value;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: TextFormField(
//                           key: ValueKey('Password'),
//                           validator: (value) {
//                             if (value.isEmpty || value.length < 7) {
//                               return 'Please enter a valid Password';
//                             }
//                             return null;
//                           },
//                           keyboardType: TextInputType.emailAddress,
//                           focusNode: _passwordFocusNode,
//                           decoration: InputDecoration(
//                               border: const UnderlineInputBorder(),
//                               filled: true,
//                               prefixIcon: Icon(Icons.lock),
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _obscureText = !_obscureText;
//                                   });
//                                 },
//                                 child: Icon(_obscureText
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                               ),
//                               labelText: 'Password',
//                               fillColor: Theme.of(context).backgroundColor),
//                           onSaved: (value) {
//                             _password = value;
//                           },
//                           obscureText: _obscureText,
//                           onEditingComplete: () => FocusScope.of(context)
//                               .requestFocus(_phoneNumberFocusNode),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: TextFormField(
//                           key: ValueKey('phone number'),
//                           focusNode: _phoneNumberFocusNode,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter a valid phone number';
//                             }
//                             return null;
//                           },
//                           textInputAction: TextInputAction.next,
//                           onEditingComplete: _submitForm,
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                               border: const UnderlineInputBorder(),
//                               filled: true,
//                               prefixIcon: Icon(Icons.phone_android),
//                               labelText: 'Phone number',
//                               fillColor: Theme.of(context).backgroundColor),
//                           onSaved: (value) {
//                             _phoneNumber = int.parse(value);
//                           },
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           SizedBox(width: 10),
//                           ElevatedButton(
//                               style: ButtonStyle(
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   side: BorderSide(
//                                       color: ColorsConsts.backgroundColor),
//                                 ),
//                               )),
//                               onPressed: _submitForm,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Sign up',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 17),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(
//                                     Feather.user,
//                                     size: 18,
//                                   )
//                                 ],
//                               )),
//                           SizedBox(width: 20),
//                         ],
//                       ),
//                     ],
//                   ))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flushfood/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/background-image.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';

  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(
          image: "assets/images/register_bg.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]?.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    const TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    const TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const RoundedButton(buttonName: 'Register'),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/LoginScreen');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
