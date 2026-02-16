import 'package:flutter/material.dart';
import 'package:prism/prism.dart';

class InputsDemo extends StatefulWidget {
  const InputsDemo({super.key});

  @override
  State<InputsDemo> createState() => _InputsDemoState();
}

class _InputsDemoState extends State<InputsDemo> {
  final _formKey = GlobalKey<FormState>();
  bool _switchValue = false;
  bool _checkboxValue = false;
  String _radioValue = 'Option 1';
  String _selectValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('输入/表单 (Inputs)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PrismTextField', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismTextField(
              label: 'Username',
              hint: 'Enter your username',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),
            const PrismTextField(
              label: 'Password',
              hint: 'Enter your password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 32),
            const Text('PrismTextFormField (Form)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrismTextFormField(
                    label: 'Email (with validation)',
                    hint: 'Enter your email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  PrismButton(
                    text: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('PrismSearchBar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismSearchBar(
              onSearch: (value) {},
              hint: 'Search...',
            ),
            const SizedBox(height: 32),
            const Text('PrismSwitch', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
              label: 'Enable notifications',
            ),
            const SizedBox(height: 32),
            const Text('PrismCheckbox', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismCheckbox(
              value: _checkboxValue,
              onChanged: (value) {
                setState(() {
                  _checkboxValue = value ?? false;
                });
              },
              label: 'I agree to the terms',
            ),
            const SizedBox(height: 32),
            const Text('PrismRadio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismRadio<String>(
              value: 'Option 1',
              groupValue: _radioValue,
              onChanged: (value) => setState(() => _radioValue = value!),
              label: 'Option 1',
            ),
            PrismRadio<String>(
              value: 'Option 2',
              groupValue: _radioValue,
              onChanged: (value) => setState(() => _radioValue = value!),
              label: 'Option 2',
            ),
            const SizedBox(height: 32),
            const Text('PrismSelect', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismSelect<String>(
              label: 'Choose an option',
              items: const [
                DropdownMenuItem(value: '1', child: Text('Item 1')),
                DropdownMenuItem(value: '2', child: Text('Item 2')),
                DropdownMenuItem(value: '3', child: Text('Item 3')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectValue = value!;
                });
              },
              value: _selectValue,
            ),
            const SizedBox(height: 32),
            const Text('PrismDatePicker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            PrismDatePicker(
              label: 'Date of Birth',
              value: DateTime.now(),
              onChanged: (date) {},
              firstDate: DateTime(2000),
              lastDate: DateTime(2030),
            ),
            const SizedBox(height: 32),
            const Text('PrismRichEditor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const PrismRichEditor(
              initialValue: '# Hello World\nThis is a rich text editor.',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
