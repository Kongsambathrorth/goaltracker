import '/flutter_flow/flutter_flow_util.dart';
import 'creat_task_component_widget.dart' show CreatTaskComponentWidget;
import 'package:flutter/material.dart';

class CreatTaskComponentModel
    extends FlutterFlowModel<CreatTaskComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TaskTtitle widget.
  FocusNode? taskTtitleFocusNode;
  TextEditingController? taskTtitleController;
  String? Function(BuildContext, String?)? taskTtitleControllerValidator;
  String? _taskTtitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TaskDecription widget.
  FocusNode? taskDecriptionFocusNode;
  TextEditingController? taskDecriptionController;
  String? Function(BuildContext, String?)? taskDecriptionControllerValidator;
  String? _taskDecriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    taskTtitleControllerValidator = _taskTtitleControllerValidator;
    taskDecriptionControllerValidator = _taskDecriptionControllerValidator;
  }

  @override
  void dispose() {
    taskTtitleFocusNode?.dispose();
    taskTtitleController?.dispose();

    taskDecriptionFocusNode?.dispose();
    taskDecriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
