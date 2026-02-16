import 'package:flutter/material.dart';
import 'prism_text_field.dart';

class PrismTextFormField extends FormField<String> {
  final TextEditingController? controller;

  PrismTextFormField({
    super.key,
    this.controller,
    String? initialValue,
    super.onSaved,
    super.validator,
    super.autovalidateMode,
    bool enabled = true,
    
    // PrismTextField properties
    String? label,
    String? hint,
    IconData? prefixIcon,
    Widget? suffix,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
    PrismInputSize size = PrismInputSize.medium,
    PrismInputStatus status = PrismInputStatus.neutral,
    double? width,
    int? maxLines = 1,
    String? successText,
    ValueChanged<String>? onSubmitted,
  }) : super(
          initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled,
          builder: (FormFieldState<String> field) {
            final _PrismTextFormFieldState state = field as _PrismTextFormFieldState;
            
            void onChangedHandler(String value) {
              state.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return PrismTextField(
              controller: state._effectiveController,
              label: label,
              hint: hint,
              prefixIcon: prefixIcon,
              suffix: suffix,
              obscureText: obscureText,
              onChanged: onChangedHandler,
              errorText: field.errorText, // Use FormField error text
              successText: successText,
              size: size,
              status: field.hasError ? PrismInputStatus.error : status,
              width: width,
              maxLines: maxLines,
              enabled: enabled,
              onSubmitted: onSubmitted,
            );
          },
        );

  @override
  FormFieldState<String> createState() => _PrismTextFormFieldState();
}

class _PrismTextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!;

  @override
  PrismTextFormField get widget => super.widget as PrismTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(PrismTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller = TextEditingController.fromValue(oldWidget.controller!.value);
      }
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
