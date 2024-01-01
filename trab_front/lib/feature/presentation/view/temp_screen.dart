import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trab_front/feature/presentation/viewmodel/temp_screen_view_model.dart';

class TempScreen extends ConsumerStatefulWidget {
  const TempScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TempScreenState();
  }
}

class _TempScreenState extends ConsumerState<TempScreen> {
  @override
  Widget build(BuildContext context) {
    //상태 리스너
    var _count = ref.watch(tempScreenControllerProvider).count;
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("riverpod example ${_count}"),
          onPressed: ref
              .read(tempScreenControllerProvider.notifier)
              .handleButtonPressed,
        ),
      ),
    );
  }
}
