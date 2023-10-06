import 'package:flutter/material.dart';

import '../../../core/enum/rm_unit_type.dart';
import '../../../core/enum/weight_unit_type.dart';
import '../../../core/keys/form_keys.dart';
import '../../../gen/assets.gen.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';

class CreateItemBottomSheet extends StatefulWidget {
  const CreateItemBottomSheet({
    super.key,
  });

  @override
  State<CreateItemBottomSheet> createState() => _CreateItemBottomSheetState();
}

class _CreateItemBottomSheetState extends State<CreateItemBottomSheet> {
  WeightUnitType selectedWightType = WeightUnitType.kg;
  RmUnitType selectedRmType = RmUnitType.times;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
          color: Color(0xEA000000),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            '種目',
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorTheme.primaryText,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.75,
                              child: InputTextForm(
                                textFormKey: textFormKey,
                                validator: (text) => '',
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 20,
                      right: 5,
                      child: SizedBox(
                        height: 50,
                        child: Assets.images.listChoiceTooltip.image(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    '重量',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorTheme.primaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: InputTextForm(
                        textFormKey: textFormKey2,
                        validator: (text) => '',
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<WeightUnitType>(
                      value: selectedWightType,
                      dropdownColor: ColorTheme.primaryBackGround,
                      focusColor: Colors.transparent,
                      style: TextStyle(
                        color: ColorTheme.primaryText,
                      ),
                      items: [
                        DropdownMenuItem<WeightUnitType>(
                          value: WeightUnitType.kg,
                          child: Text(
                            WeightUnitType.kg.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                        DropdownMenuItem<WeightUnitType>(
                          value: WeightUnitType.lbs,
                          child: Text(
                            WeightUnitType.lbs.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (WeightUnitType? value) {
                        setState(() {
                          selectedWightType = value ?? WeightUnitType.kg;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    '回数',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorTheme.primaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: InputTextForm(
                        textFormKey: textFormKey3,
                        validator: (text) => '',
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<RmUnitType>(
                      value: selectedRmType,
                      dropdownColor: ColorTheme.primaryBackGround,
                      focusColor: Colors.transparent,
                      style: TextStyle(
                        color: ColorTheme.primaryText,
                      ),
                      items: [
                        DropdownMenuItem<RmUnitType>(
                          value: RmUnitType.times,
                          child: Text(
                            RmUnitType.times.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                        DropdownMenuItem<RmUnitType>(
                          value: RmUnitType.rm,
                          child: Text(
                            RmUnitType.rm.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                        DropdownMenuItem<RmUnitType>(
                          value: RmUnitType.set,
                          child: Text(
                            RmUnitType.set.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                        DropdownMenuItem<RmUnitType>(
                          value: RmUnitType.minute,
                          child: Text(
                            RmUnitType.minute.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                        DropdownMenuItem<RmUnitType>(
                          value: RmUnitType.second,
                          child: Text(
                            RmUnitType.second.text,
                            style: TextStyle(
                              color: ColorTheme.primaryText,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (RmUnitType? value) {
                        print(value);
                        setState(() {
                          selectedRmType = value ?? RmUnitType.times;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
