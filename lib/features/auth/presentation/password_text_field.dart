import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const new({super.key, required this.password});
  final TextEditingController password;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.password,
      obscureText: isHidden,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hint: Text("Password"),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
