import 'package:flutter/material.dart';
import 'package:picture_learning/constants/lang.dart';

import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:picture_learning/utils/validator.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:picture_learning/widgets/scroll_keyboard.dart';
import 'package:picture_learning/widgets/text/text_md_bold_grey800.dart';

class FormAuth extends StatefulWidget {
  const FormAuth({
    Key? key,
    // Header
    required this.imgHeader,

    // Input 1
    required this.label1,
    this.obscureText1,
    required this.icon1,
    this.validator1,
    this.textInputType1,

    // Input 2
    required this.label2,
    this.obscureText2,
    required this.icon2,
    this.validator2,
    this.textInputType2,

    // Submit
    this.compareFields = false,
    required this.submitText,
    required this.submitFunction,
  }) : super(key: key);

  final Widget imgHeader;

  final String label1;
  final bool? obscureText1;
  final Icon icon1;
  final Function(String?)? validator1;
  final TextInputType? textInputType1;

  final String label2;
  final bool? obscureText2;
  final Icon icon2;
  final Function(String?)? validator2;
  final TextInputType? textInputType2;

  final bool compareFields;
  final String submitText;
  final Function(String, String) submitFunction;

  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.primary,
      body: ScrollKeyboard(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Header
            widget.imgHeader,
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height * 0.61,
                width: size.width,
                child: CustomPaint(
                  painter: PainterCurve(color: Style.white),
                ),
              ),
            ),

            // Form
            Form(
              key: form,
              child: SafeArea(
                child: Gap04(
                  child: SizedBox(
                    height: size.height * 0.44,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Input 1
                        TextMdBoldGrey800(widget.label1),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: widget.textInputType1,
                          controller: textController1,
                          obscureText: widget.obscureText1 ?? false,
                          validator: (text) => widget.validator1 != null
                              ? widget.validator1!(text)
                              : validateNotNull(text),
                          decoration: InputDecoration(
                            prefixIcon: widget.icon1,
                            labelText: widget.label1,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),

                        // Input 2
                        TextMdBoldGrey800(widget.label2),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: widget.textInputType2,
                          controller: textController2,
                          validator: (text) => widget.validator2 != null
                              ? widget.validator2!(text)
                              : validateNotNull(text),
                          obscureText: widget.obscureText2 ?? false,
                          decoration: InputDecoration(
                            prefixIcon: widget.icon2,
                            labelText: widget.label2,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                        const Spacer(),

                        // Submit
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              final isValid = form.currentState!.validate();

                              if (!isValid) {
                                return;
                              }

                              if (widget.compareFields &&
                                  textController1.text !=
                                      textController2.text) {
                                snackbarError(
                                  context,
                                  Lang.errorRegisterPassword,
                                );
                                return;
                              }

                              widget.submitFunction(
                                textController1.text,
                                textController2.text,
                              );
                            },
                            icon: const Icon(Icons.chevron_left),
                            label: Text(widget.submitText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
