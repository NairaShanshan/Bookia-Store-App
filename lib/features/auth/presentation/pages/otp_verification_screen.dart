import 'package:bookia_store_app/core/widgets/elevated_button.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/create_new_password_screen.dart';
import 'package:bookia_store_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 70,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color(0xFF24282C),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color:const  Color(0xFFE8ECF4)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(children: [GestureDetector(
          onTap: (){
            Navigator.pop(context) ;
          },
          child: SvgPicture.asset(
            'assets/images/back.svg',
            width: 41,
            height: 41,
          ),
        ),],) ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2F2F2F),
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the verification code we just sent on your email address.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8391A1),
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),


                Center(
                  child: Pinput(
                    length: 4,
                    controller: otpController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFBFA054)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color:const Color(0xFFF7F8F9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:const Color(0xFF8391A1)),
                      ),
                    ),
                    onCompleted: (pin) {
                      print("OTP Entered: $pin");
                    },
                  ),
                ),

                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    print("Verify OTP: ${otpController.text}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateNewPasswordScreen()),
                    );
                  },
                  text: 'Verify',
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn’t received code?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF24282C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // هنا هتعملي resend OTP
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFBFA054),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
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
