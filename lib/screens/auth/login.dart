// import 'package:flushfood/consts/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

// class LoginScreen extends StatefulWidget {
//   static const routeName = '/LoginScreen';
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final FocusNode _passwordFocusNode = FocusNode();
//   bool _obscureText = true;
//   String _emailAddress = '';
//   String _password = '';
//   final _formKey = GlobalKey<FormState>();
//   @override
//   void dispose() {
//     _passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     final isValid = _formKey.currentState.validate();
//     FocusScope.of(context).unfocus();
//     if (isValid) {
//       _formKey.currentState.save();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ShaderMask(
//             shaderCallback: (rect) => const LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.center,
//               colors: [Colors.black, Colors.transparent],
//             ).createShader(rect),
//             blendMode: BlendMode.darken,
//             child: Container(
//               // ignore: prefer_const_constructors
//               decoration: BoxDecoration(
//                 image: const DecorationImage(
//                   image: AssetImage('assets/images/login_bg.png'),
//                   fit: BoxFit.cover,
//                   colorFilter:
//                       ColorFilter.mode(Colors.black54, BlendMode.darken),
//                 ),
//               ),
//             ),
//           ),

//           // Container(
//           //   height: MediaQuery.of(context).size.height * 0.95,
//           //   child: RotatedBox(
//           //     quarterTurns: 2,
//           //     child: WaveWidget(
//           //       config: CustomConfig(
//           //         gradients: [
//           //           [ColorsConsts.gradiendFStart, ColorsConsts.gradiendLStart],
//           //           [ColorsConsts.gradiendFEnd, ColorsConsts.gradiendLEnd],
//           //         ],
//           //         durations: [19440, 10800],
//           //         heightPercentages: [0.20, 0.25],
//           //         blur: MaskFilter.blur(BlurStyle.solid, 10),
//           //         gradientBegin: Alignment.bottomLeft,
//           //         gradientEnd: Alignment.topRight,
//           //       ),
//           //       waveAmplitude: 0,
//           //       size: Size(
//           //         double.infinity,
//           //         double.infinity,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 80),
//                 height: 120.0,
//                 width: 120.0,
//                 decoration: BoxDecoration(
//                   //  color: Theme.of(context).backgroundColor,
//                   borderRadius: BorderRadius.circular(20),

//                   shape: BoxShape.rectangle,
//                 ),
//                 child: const Text("Flush Food",style: TextStyle(
//                   fontSize:30,fontWeight:FontWeight.bold,
//                 ),),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: TextFormField(
//                           key: ValueKey('email'),
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
//                               prefixIcon: const Icon(Icons.email),
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
//                           key: const ValueKey('Password'),
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
//                           onEditingComplete: _submitForm,
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
//                                     'Login',
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/background-image.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
    }
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'FlushFood',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ignore: prefer_const_constructors
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  // ignore: prefer_const_constructors
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: const Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const RoundedButton(
                    buttonName: 'Login',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/SignUpScreen'),
                child: Container(
                  child: const Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color kBlue = Color(0xff5663ff);

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key key,
    this.icon,
    this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  PasswordInput({
    Key key,
    this.icon,
    this.hint,
    this.inputAction,
  }) : super(key: key);
  bool _obscureText = true;
  String _password;
  final IconData icon;
  final String hint;

  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode _passwordFocusNode;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
              key: const ValueKey('Password'),
              validator: (value) {
                if (value.isEmpty || value.length < 7) {
                  return 'Please enter a valid Password';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                               border: const UnderlineInputBorder(),
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
//

              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28,
                    color: kWhite,
                  ),
                ),
                hintText: hint,
                hintStyle: kBodyText,
              ),
              obscureText: true,
              style: kBodyText,
              textInputAction: inputAction,
              onSaved: (value) {
                _password = value;
              }),
        ),
      ),
    );
  }
}
