import 'package:chat_bot/Verifying%20View/verifying_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VerifyingView extends StatefulWidget {
  const VerifyingView({super.key});

  @override
  State<VerifyingView> createState() => _VerifyingViewState();
}

class _VerifyingViewState extends State<VerifyingView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VerifyingViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold();
        });
  }
}
