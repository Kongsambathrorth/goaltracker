import '/backend/supabase/supabase.dart';
import '/components/creat_task_component/creat_task_component_widget.dart';
import '/components/update_task_component/update_task_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'tasks_page_model.dart';
export 'tasks_page_model.dart';

class TasksPageWidget extends StatefulWidget {
  const TasksPageWidget({
    super.key,
    required this.goalId,
  });

  final int? goalId;

  @override
  State<TasksPageWidget> createState() => _TasksPageWidgetState();
}

class _TasksPageWidgetState extends State<TasksPageWidget>
    with TickerProviderStateMixin {
  late TasksPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 5.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasksPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: 370.0,
                      child: CreatTaskComponentWidget(
                        goalId: widget.goalId!,
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));

            setState(() => _model.requestCompleter = null);
            await _model.waitForRequestCompleted();
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).accent3,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'HomePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 200),
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Text(
                          ' Goal Tasks',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 24.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<List<TasksRow>>(
                      future: (_model.requestCompleter ??=
                              Completer<List<TasksRow>>()
                                ..complete(TasksTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'goal_id',
                                        widget.goalId,
                                      )
                                      .order('created_at'),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<TasksRow> listViewTasksRowList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTasksRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTasksRow =
                                listViewTasksRowList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: UpdateTaskComponentWidget(
                                            rowtask: listViewTasksRow,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  setState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 49.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (listViewTasksRow.complete == true)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await TasksTable().update(
                                                data: {
                                                  'complete': false,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  listViewTasksRow.id,
                                                ),
                                              );
                                              setState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCheckCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          ),
                                        if (listViewTasksRow.complete == false)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await TasksTable().update(
                                                data: {
                                                  'complete': true,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  listViewTasksRow.id,
                                                ),
                                              );
                                              setState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted();
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (listViewTasksRow.complete ==
                                                  false)
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewTasksRow.title,
                                                    '1',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              if (listViewTasksRow.complete ==
                                                  true)
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewTasksRow.title,
                                                    '1',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 41.0,
                                          icon: Icon(
                                            Icons.delete_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            await TasksTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                listViewTasksRow.id,
                                              ),
                                            );
                                            setState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
