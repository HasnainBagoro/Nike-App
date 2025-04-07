import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String? inputText;
  final IconData? iconData;
  final bool? obsecuretext;

  const CustomInputField({
    super.key,
    this.inputText,
    this.iconData,
    this.obsecuretext = false,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obsecuretext ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: _isObscured,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          hintText: widget.inputText,
          prefixIcon: widget.iconData != null
              ? Icon(
                  widget.iconData,
                  color: Colors.blue,
                )
              : null,
          suffixIcon: widget.obsecuretext == true
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
