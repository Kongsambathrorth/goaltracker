import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'creat_goal_component_widget.dart' show CreatGoalComponentWidget;
import 'package:flutter/material.dart';

class CreatGoalComponentModel
    extends FlutterFlowModel<CreatGoalComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for GoalTitleText widget.
  FocusNode? goalTitleTextFocusNode;
  TextEditingController? goalTitleTextController;
  String? Function(BuildContext, String?)? goalTitleTextControllerValidator;
  String? _goalTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for GoalDesctiption widget.
  FocusNode? goalDesctiptionFocusNode;
  TextEditingController? goalDesctiptionController;
  String? Function(BuildContext, String?)? goalDesctiptionControllerValidator;
  String? _goalDesctiptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for GoalStatus widget.
  String? goalStatusValue;
  FormFieldController<String>? goalStatusValueController;
  // State field(s) for GoalProgress widget.
  double? goalProgressValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    goalTitleTextControllerValidator = _goalTitleTextControllerValidator;
    goalDesctiptionControllerValidator = _goalDesctiptionControllerValidator;
  }

  @override
  void dispose() {
    goalTitleTextFocusNode?.dispose();
    goalTitleTextController?.dispose();

    goalDesctiptionFocusNode?.dispose();
    goalDesctiptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
