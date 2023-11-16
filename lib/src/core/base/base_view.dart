import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView<T extends StateNotifier> extends ConsumerStatefulWidget {
  final Widget Function(BuildContext context, T notifier, WidgetRef ref)
      onPageBuilder;
  final T Function(WidgetRef ref) initNotifier;
  final Function(T notifier) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.initNotifier,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends StateNotifier>
    extends ConsumerState<BaseView<T>> {
  bool snackBarActive = false;
  late T notifier;

  @override
  void initState() {
    notifier = widget.initNotifier(ref);
    widget.onModelReady(notifier);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer(
          builder: (context, ref, child) =>
              widget.onPageBuilder(context, notifier, ref)),
    );
  }
}
