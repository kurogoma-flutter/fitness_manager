import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/enum/rm_unit_type.dart';
import '../../../core/enum/weight_unit_type.dart';
import '../../../core/keys/form_keys.dart';
import '../../../core/logger/logger.dart';
import '../../../gen/assets.gen.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';
import '../home_page_view_model.dart';
import 'select_list_dialog.dart';

class CreateItemBottomSheet extends ConsumerStatefulWidget {
  const CreateItemBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateItemBottomSheetState();
}

class _CreateItemBottomSheetState extends ConsumerState<CreateItemBottomSheet> {
  WeightUnitType selectedWightType = WeightUnitType.kg;
  RmUnitType selectedRmType = RmUnitType.times;

  bool get ableToTapSubmitButton =>
      textFormKey.currentState?.value == null &&
      textFormKey.currentState?.value == '' &&
      weightKey.currentState?.value == null &&
      weightKey.currentState?.value == '' &&
      repKey.currentState?.value == null &&
      repKey.currentState?.value == '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
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
            child: ListView(
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
                              fontSize: 16,
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
                                validator: (text) => null,
                                onChanged: (value) {
                                  textFormKey.currentState!.didChange(value);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () async {
                                final result = await showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SelectListDialog(),
                                );
                                if (result == null) {
                                  return;
                                }
                                // 種目フィールドに入力
                                logger.d('result: $result');
                                textFormKey.currentState!.didChange(result);
                              },
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
                      fontSize: 16,
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
                        textFormKey: weightKey,
                        validator: (text) => null,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // 数字、小数点以外は消去する
                          weightKey.currentState!.didChange(
                            value.replaceAll(RegExp(r'[^0-9.]'), ''),
                          );
                          return;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<WeightUnitType>(
                      value: selectedWightType,
                      dropdownColor: ColorTheme.primaryCard,
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
                      fontSize: 16,
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
                        textFormKey: repKey,
                        validator: (_) => null,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // 数字以外は消去する
                          repKey.currentState!.didChange(
                            value.replaceAll(RegExp(r'[^0-9]'), ''),
                          );
                          return;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<RmUnitType>(
                      value: selectedRmType,
                      dropdownColor: ColorTheme.primaryCard,
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
                      ],
                      onChanged: (RmUnitType? value) {
                        setState(() {
                          selectedRmType = value ?? RmUnitType.times;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (ableToTapSubmitButton) {
                      return;
                    }

                    ref.read(homePageViewModelProvider.notifier).addNewRecord(
                          category: textFormKey.currentState!.value!,
                          load: double.parse(
                            double.parse(
                              weightKey.currentState!.value!,
                            ).toStringAsFixed(1),
                          ),
                          weightUnitType: selectedWightType,
                          time: int.parse(
                            repKey.currentState!.value!,
                          ),
                          rmUnitType: selectedRmType,
                        );
                    if (!mounted) {
                      return;
                    }
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ColorTheme.secondaryButton,
                    ),
                  ),
                  child: Text(
                    '登録する',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorTheme.secondaryText,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: ColorTheme.primaryIcon,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
