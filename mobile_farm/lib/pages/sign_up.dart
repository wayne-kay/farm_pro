import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _first = TextEditingController(), _last = TextEditingController(), _email = TextEditingController(), _phone = TextEditingController(), _location = TextEditingController(), _address = TextEditingController(), _password = TextEditingController();
  bool _hidden = true;
  String? _error;

  @override
  void dispose() { for (final c in [_first, _last, _email, _phone, _location, _address, _password]) { c.dispose(); } super.dispose(); }
  String? _required(String? v) => v == null || v.trim().isEmpty ? 'This field is required' : null;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _error = null);
    final authService = context.read<AuthService>();
    final success = await authService.register({'firstname': _first.text.trim(), 'lastname': _last.text.trim(), 'email': _email.text.trim(), 'phone': _phone.text.trim(), 'location': _location.text.trim(), 'address': _address.text.trim(), 'password': _password.text});
    if (!mounted) return;
    if (success) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      setState(() => _error = authService.lastError ?? 'Registration failed. Check your details and try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    return Scaffold(appBar: AppBar(title: const Text('Create account')), body: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: Form(key: _formKey, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text('Join Tulime', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center), const SizedBox(height: 24),
      Row(children: [Expanded(child: TextFormField(controller: _first, decoration: const InputDecoration(labelText: 'First name'), validator: _required)), const SizedBox(width: 12), Expanded(child: TextFormField(controller: _last, decoration: const InputDecoration(labelText: 'Last name'), validator: _required))]),
      const SizedBox(height: 16), TextFormField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)), validator: (v) => v == null || !v.contains('@') ? 'Enter a valid email' : null),
      const SizedBox(height: 16), TextFormField(controller: _phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Phone'), validator: _required),
      const SizedBox(height: 16), TextFormField(controller: _location, decoration: const InputDecoration(labelText: 'Location'), validator: _required),
      const SizedBox(height: 16), TextFormField(controller: _address, decoration: const InputDecoration(labelText: 'Address'), validator: _required),
      const SizedBox(height: 16), TextFormField(controller: _password, obscureText: _hidden, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline), suffixIcon: IconButton(icon: Icon(_hidden ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => _hidden = !_hidden))), validator: (v) => v == null || v.length < 8 ? 'Use at least 8 characters' : null),
      if (_error != null) Padding(padding: const EdgeInsets.only(top: 16), child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error))),
      const SizedBox(height: 24), FilledButton(onPressed: auth.isLoading ? null : _submit, child: auth.isLoading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Register')), const SizedBox(height: 8), TextButton(onPressed: () => Navigator.pop(context), child: const Text('Already have an account? Log in')),
    ]))))));
  }
}
