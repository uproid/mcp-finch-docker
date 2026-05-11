import 'package:app/db/todos_db.dart';
import 'package:finch/mcp.dart';

class McpController extends McpServerController {
  Map<String, Schema> _todoSchema = {
    'id': Schema(
      type: 'integer',
      description: 'ID of the todo item',
    ),
    'title': Schema(
      type: 'string',
      description: 'Title of the todo item',
    ),
    'description': Schema(
      type: 'string',
      description: 'Description of the todo item',
    ),
    'is_completed': Schema(
      type: 'boolean',
      description: 'Completion status of the todo item',
    ),
    'created_at': Schema(
      type: 'string',
      description: 'Creation timestamp of the todo item',
    ),
    'updated_at': Schema(
      type: 'string',
      description: 'Last update timestamp of the todo item',
    )
  };

  @override
  void configure(McpBuilder mcp) {
    /// GET ALL TODOS TOOL
    mcp.tool(
      name: 'get_all_todos',
      handler: _getAllTodos,
      outputSchema: ToolSchema(
        type: 'object',
        properties: {
          'items': ToolSchema(
            type: 'array',
            properties: _todoSchema,
          )
        },
      ),
    );

    /// INSERT todo TOOL
    mcp.tool(
      name: 'insert_todo',
      handler: _insertTodo,
      inputSchema: ToolSchema(
        type: 'object',
        properties: {
          'title': Schema(
            type: 'string',
            description: 'Title of the todo item',
          ),
          'description': Schema(
            type: 'string',
            description: 'Description of the todo item',
          ),
        },
        required: ['title'],
      ),
      outputSchema: ToolSchema(
        type: 'object',
        properties: _todoSchema,
      ),
    );

    /// Update todo
    mcp.tool(
      name: 'update_todo',
      handler: _updateTodo,
      inputSchema: ToolSchema(
        type: 'object',
        properties: {
          'id': Schema(
            type: 'integer',
            description: 'ID of the todo item to update',
          ),
          'title': Schema(
            type: 'string',
            description: 'Title of the todo item',
          ),
          'description': Schema(
            type: 'string',
            description: 'Description of the todo item',
          ),
        },
        required: ['id', 'title', 'description'],
      ),
      outputSchema: ToolSchema(
        type: 'object',
        properties: _todoSchema,
      ),
    );

    // DELETE todo
    mcp.tool(
      name: 'delete_todo',
      handler: _deleteTodo,
      inputSchema: ToolSchema(
        type: 'object',
        properties: {
          'id': Schema(
            type: 'integer',
            description: 'ID of the todo item to delete',
          ),
        },
        required: ['id'],
      ),
      outputSchema: ToolSchema(
        type: 'object',
        properties: {
          'success': Schema(
            type: 'boolean',
            description: 'Indicates if the deletion was successful',
          ),
          'message': Schema(
            type: 'string',
            description: 'Message indicating the result of the deletion',
          ),
        },
      ),
    );
  }

  Future<CallToolResult> _deleteTodo(CallToolRequest req) async {
    var id = req.params.arguments!['id'] as int?;

    if (id == null) {
      throw Exception('ID is required for deleting a todo item.');
    }

    var res = await TodosDB().delete(id);

    if (res.error) {
      throw Exception(res.errorMsg);
    }

    if (res.affectedRows == 0) {
      return CallToolResult(
        content: [],
        structuredContent: {
          'success': false,
          'message': 'No todo item found with the provided ID.',
        },
      );
    }

    return CallToolResult(
      content: [],
      structuredContent: {
        'success': true,
        'message': 'Todo item deleted successfully',
      },
    );
  }

  Future<CallToolResult> _getAllTodos(CallToolRequest req) async {
    var todos = await TodosDB().findAll();

    if (todos.rows.error) {
      throw Exception(todos.rows.errorMsg);
    }

    return CallToolResult(
      content: [],
      structuredContent: {
        'items': todos.rows.assoc,
      },
    );
  }

  Future<CallToolResult> _insertTodo(CallToolRequest req) async {
    var title = req.params.arguments!['title'] as String?;
    var description = req.params.arguments!['description'] as String?;

    var now = DateTime.now();
    var res = await TodosDB().insert({
      'title': title,
      'description': description,
    });

    if (res.error) {
      throw Exception(res.errorMsg);
    }

    return CallToolResult(
      content: [],
      structuredContent: {
        'id': res.insertId,
        'title': title,
        'description': description,
        'is_completed': false,
        'created_at': now.toIso8601String(),
        'updated_at': now.toIso8601String(),
      },
    );
  }

  Future<CallToolResult> _updateTodo(CallToolRequest req) async {
    var id = req.params.arguments!['id'] as int?;
    var title = req.params.arguments!['title'] as String?;
    var description = req.params.arguments!['description'] as String?;

    if (id == null) {
      throw Exception('ID is required for updating a todo item.');
    }

    var now = DateTime.now();
    var res = await TodosDB().update(id, {
      'title': title,
      'description': description,
    });

    if (res.error) {
      throw Exception(res.errorMsg);
    }

    return CallToolResult(
      content: [],
      structuredContent: {
        'id': id,
        'title': title,
        'description': description,
        'is_completed': false,
        'created_at': now.toIso8601String(),
        'updated_at': now.toIso8601String(),
      },
    );
  }
}
