import '../database.dart';

class TasksTable extends SupabaseTable<TasksRow> {
  @override
  String get tableName => 'tasks';

  @override
  TasksRow createRow(Map<String, dynamic> data) => TasksRow(data);
}

class TasksRow extends SupabaseDataRow {
  TasksRow(super.data);

  @override
  SupabaseTable get table => TasksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get goalId => getField<int>('goal_id');
  set goalId(int? value) => setField<int>('goal_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool get complete => getField<bool>('complete')!;
  set complete(bool value) => setField<bool>('complete', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
