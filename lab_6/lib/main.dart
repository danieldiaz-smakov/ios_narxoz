import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RegistrationScreen()));
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _accepted = false;
  bool _isTeacher = false;
  String _termsError = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    bool formValid = _formKey.currentState!.validate();

    setState(() {
      if (_accepted) {
        _termsError = '';
      } else {
        _termsError = 'You must accept the Terms and Conditions';
      }
    });

    if (formValid && _accepted) {
      String name = _nameController.text;
      String email = _emailController.text;
      String role = _isTeacher ? 'Teacher' : 'Student';

      print('--- Registration data ---');
      print('Full name: $name');
      print('Email: $email');
      print('Password: ******');
      print('Role: $role');
      print('Terms accepted: $_accepted');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 24),
                    const Text('User Registration'),
                    const SizedBox(height: 24),

                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Full name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'name@narxoz.kz',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Email must contain @ and .';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _isTeacher ? 'Role: Teacher' : 'Role: Student',
                          ),
                        ),
                        Switch(
                          value: _isTeacher,
                          onChanged: (value) {
                            setState(() {
                              _isTeacher = value;
                            });
                          },
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Checkbox(
                          value: _accepted,
                          onChanged: (value) {
                            setState(() {
                              _accepted = value == true;
                              if (_accepted) {
                                _termsError = '';
                              }
                            });
                          },
                        ),
                        const Expanded(
                          child: Text('I accept the Terms and Conditions'),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _termsError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submit,
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}