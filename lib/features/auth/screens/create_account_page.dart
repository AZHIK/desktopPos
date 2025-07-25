import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/providers/users_dao_provider.dart';

import '../../../widgets/form_fields.dart';
import '../../../core/validators/validate.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _createAccount() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final usersDao = ref.read(usersDaoProvider);
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // Check if username already exists
      final existingUser = await usersDao.getUserByUsername(username);
      if (existingUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username already exists')),
        );
        setState(() => _isLoading = false);
        return;
      }

      // Insert new user
      await usersDao.createUser(
        UsersCompanion(
          username: Value(username),
          password: Value(password), // In production, hash this
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      context.go('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const double formWidth = 400;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: formWidth,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  AppTextFormField(
                    label: 'Username',
                    controller: _usernameController,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please enter a username' : null,
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: AppValidator.validatePassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: _validateConfirmPassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _createAccount,
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Create Account'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => context.go('/login'),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
