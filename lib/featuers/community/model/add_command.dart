// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AddedCommand extends StatefulWidget {
  const AddedCommand({Key? key}) : super(key: key);

  @override
  _AddedCommandState createState() => _AddedCommandState();
}

class _AddedCommandState extends State<AddedCommand> {
  String? selectedStage;
  String? selectedClass;
  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    hint: const Text('المرحلة الدراسية'),
                    value: selectedStage,
                    items: const [
                      DropdownMenuItem(value: 'المرحلة الابتدائية', child: Text('المرحلة الابتدائية')),
                      DropdownMenuItem(value: 'المرحلة الإعدادية', child: Text('المرحلة الإعدادية')),
                      DropdownMenuItem(value: 'المرحلة الثانوية', child: Text('المرحلة الثانوية')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedStage = value as String;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  hint: const Text('الصف الدراسي'),
                  value: selectedClass,
                  items: const [
                    DropdownMenuItem(value: 'الصف الأول', child: Text('الصف الأول')),
                    DropdownMenuItem(value: 'الصف الثاني', child: Text('الصف الثاني')),
                    DropdownMenuItem(value: 'الصف الثالث', child: Text('الصف الثالث')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedClass = value as String;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  hint: const Text('المادة الدراسية'),
                  value: selectedSubject,
                  items: const [
                    DropdownMenuItem(value: 'اللغة العربية', child: Text('اللغة العربية')),
                    DropdownMenuItem(value: 'الرياضيات', child: Text('الرياضيات')),
                    DropdownMenuItem(value: 'العلوم', child: Text('العلوم')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedSubject = value as String;
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'اكتب تعليقك هنا...',
                  ),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text('نشر'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
