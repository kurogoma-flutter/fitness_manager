import 'package:flutter/material.dart';

import '../../../core/keys/form_keys.dart';
import '../../component/form/input_text_form.dart';

class CreateItemBottomSheet extends StatelessWidget {
  const CreateItemBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.8,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputTextForm(
                textFormKey: textFormKey,
                validator: (text) => '',
              ),
              const SizedBox(height: 24),
              InputTextForm(
                textFormKey: textFormKey2,
                validator: (text) => '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
