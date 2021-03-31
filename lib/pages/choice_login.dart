
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/pages/profile.dart';

import 'log_sign/home_login.dart';

class ChoiceLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        print(snapshot.data);
        return (!snapshot.hasData)
            ? HomeLogin()
            : ProfilPage(me);
      },
    );
  }
}
