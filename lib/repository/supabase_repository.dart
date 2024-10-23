import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/models/task_model.dart';

class SupabaseRepository {
  Future<List<TaskGroup>> listTaskGroups() async {
    final client = Supabase.instance.client;
    final response = await client.from('task_groups').select();
    final taskGroups = response.map((task) => TaskGroup.fromMap(task)).toList();

    return taskGroups;

  }

  Future<List<Task>> listTasksByGroup(String groupId) async {
    final client = Supabase.instance.client;
    final response = await client.from('tasks').select().eq('task_group_id', groupId);
    return response.map((task) => Task.fromMap(task)).toList();

  }

}