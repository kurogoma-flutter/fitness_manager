import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/enum/rm_unit_type.dart';
import '../../../core/enum/weight_unit_type.dart';
import '../../../core/keys/form_keys.dart';
import '../../../core/logger/logger.dart';
import '../../../core/model/isar/record/record_collection.dart';
import '../../../gen/assets.gen.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';
import '../home_page_view_model.dart';
import 'select_list_dialog.dart';

class EditItemBottomSheet extends ConsumerStatefulWidget {
  const EditItemBottomSheet({
    required this.record,
    super.key,
  });

  final Record record;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditItemBottomSheetState();
}

class _EditItemBottomSheetState extends ConsumerState<EditItemBottomSheet> {
  WeightUnitType selectedWightType = WeightUnitType.kg;
  RmUnitType selectedRmType = RmUnitType.times;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        textFormKeyEdit.currentState!.didChange(widget.record.category);
        weightKeyEdit.currentState!.didChange(_loadText(widget.record.load));
        repKeyEdit.currentState!.didChange(widget.record.time.toString());
        memoKeyEdit.currentState!.didChange(widget.record.memo);
        selectedWightType = widget.record.weightUnitType;
        selectedRmType = widget.record.rmUnitType;
      });
    });
    super.didChangeDependencies();
  }

  String _loadText(double load) {
    // loadが整数であれば小数点以下を削除
    if (load % 1 == 0) {
      return load.toInt().toString();
    }
    return load.toString();
  }

  bool get ableToTapUpdateButton =>
      textFormKeyEdit.currentState?.value != null &&
      textFormKeyEdit.currentState?.value != '' &&
      weightKeyEdit.currentState?.value != null &&
      weightKeyEdit.currentState?.value != '' &&
      repKeyEdit.currentState?.value != null &&
      repKeyEdit.currentState?.value != '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.75,
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
                                textFormKey: textFormKeyEdit,
                                validator: (text) => null,
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  setState(() {
                                    textFormKeyEdit.currentState!
                                        .didChange(value);
                                  });
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
                                textFormKeyEdit.currentState!.didChange(result);
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
                        textFormKey: weightKeyEdit,
                        validator: (text) => null,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // 数字、小数点以外は消去する
                          setState(() {
                            weightKeyEdit.currentState!.didChange(
                              value.replaceAll(RegExp(r'[^0-9.]'), ''),
                            );
                          });
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
                        textFormKey: repKeyEdit,
                        validator: (_) => null,
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // 数字以外は消去する
                          setState(() {
                            repKeyEdit.currentState!.didChange(
                              value.replaceAll(RegExp(r'[^0-9]'), ''),
                            );
                          });
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'メモ',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorTheme.primaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                InputTextForm.multiLine(
                  initialValue: widget.record.memo ?? '',
                  textFormKey: memoKeyEdit,
                  validator: (_) => null,
                  maxLength: 500,
                  onChanged: (value) {
                    setState(() {
                      memoKeyEdit.currentState!.didChange(value);
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: ableToTapUpdateButton
                      ? () {
                          ref
                              .read(homePageViewModelProvider.notifier)
                              .updateRecord(
                                targetRecord: widget.record,
                                category: textFormKeyEdit.currentState!.value!,
                                load: double.parse(
                                  double.parse(
                                    weightKeyEdit.currentState!.value!,
                                  ).toStringAsFixed(1),
                                ),
                                weightUnitType: selectedWightType,
                                time: int.parse(
                                  repKeyEdit.currentState!.value!,
                                ),
                                rmUnitType: selectedRmType,
                                memo: memoKeyEdit.currentState?.value,
                              );
                          if (!mounted) {
                            return;
                          }
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.primaryActive,
                    disabledBackgroundColor: ColorTheme.secondaryButton,
                  ),
                  child: Text(
                    '更新する',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorTheme.secondaryText,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
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
