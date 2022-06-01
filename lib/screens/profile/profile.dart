import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/google_sign_in.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          user!.displayName.toString(),
          style: GoogleFonts.lato(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          maxRadius: 60,
          backgroundImage: NetworkImage(
            user.photoURL.toString(),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Divider(),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
              color: Color.fromARGB(255, 185, 146, 192),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              user.displayName.toString(),
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.email_outlined,
              size: 30,
              color: Color.fromARGB(255, 185, 146, 192),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              user.email.toString(),
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.phone_outlined,
              size: 30,
              color: Color.fromARGB(255, 185, 146, 192),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              user.phoneNumber.toString(),
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Divider(),
        Spacer(),
        OutlinedButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
          child: Text(
            'Logout',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
