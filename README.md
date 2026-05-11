# MCP Server with Finch Framework

A Model Context Protocol (MCP) server built with [Finch](https://pub.dev/packages/finch), a modern Dart web framework. This project demonstrates how to create an MCP-compliant server that exposes tools for todo management while providing a web UI.

## Overview

This MCP server provides:

- **MCP Tools**: Tools for managing todos (get all, insert, update, delete, etc.)
- **Web Interface**: A responsive web UI for interactive todo management
- **Authentication**: Built-in authentication layer for MCP endpoints
- **Database**: SQLite-backed persistence with automatic migrations
- **Hot Reload**: Real-time widget and language file updates during development
- **Multi-language Support**: Internationalization with JSON-based language files

## Features

### MCP Tools
- `get_all_todos` - Retrieve all todo items with complete details
- `insert_todo` - Create new todo items
- Standard CRUD operations for todo management

### Technology Stack
- **Framework**: [Finch](https://pub.dev/packages/finch) - Dart web framework
- **Database**: SQLite with automatic schema migrations
- **Templating**: Jinja2 templates for dynamic UI rendering
- **Language Support**: JSON-based i18n with Dart code generation

## Project Structure

```
├── lib/
│   ├── app.dart                 # Main application configuration
│   ├── serve.dart               # Development server with hot reload
│   ├── watcher.dart             # File watcher for development
│   ├── controllers/
│   │   ├── home_controller.dart # Home page & UI handler
│   │   ├── mcp_controller.dart  # MCP tools implementation
│   │   └── mcp_auth_controller.dart  # Authentication layer
│   ├── db/
│   │   └── todos_db.dart        # Database access layer
│   ├── languages/               # i18n language files
│   └── widgets/                 # Jinja2 HTML templates
├── database/                    # SQLite database file
├── migrations_sqlite/           # Database migration files
├── public/                      # Static assets
├── docker-compose.yaml          # Docker development setup
└── pubspec.yaml                 # Dart dependencies
```

## Getting Started

### Prerequisites
- Dart SDK 3.0.0 or higher
- SQLite (included in most systems)

### Installation

1. Clone the repository and install dependencies:
```bash
pub get
```

### Development

Start the development server with hot reload:
```bash
dart lib/serve.dart
```

The server will:
- Start on port 80
- Watch for changes in language files and widgets
- Automatically regenerate Dart code from templates
- Reload connected clients with updates

### Production

Run the compiled application:
```bash
dart lib/app.dart
```

## Usage

### Accessing the Web Interface
Visit `http://localhost/` to access the todo management UI.

### Using MCP Tools

The MCP endpoints are available at `http://localhost/mcp/` with authentication required.

**Authentication Header Example:**
```
Authorization: Bearer <API_KEY>
```

### Example: Get All Todos
```bash
curl -X POST http://localhost/mcp/call_tool \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"tool": "get_all_todos"}'
```

### Example: Insert Todo
```bash
curl -X POST http://localhost/mcp/call_tool \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tool": "insert_todo",
    "args": {
      "title": "My Task",
      "description": "Task description"
    }
  }'
```

## Docker Deployment

Build and run with Docker:
```bash
docker-compose up -d
```

The application will be available at `http://localhost:80`

## Configuration

Edit [lib/app.dart](lib/app.dart) to customize:
- **Port**: Change `port: 80` for a different listening port
- **Database**: Modify `sqliteConfig` for database location
- **Languages**: Update `languagePath` for language files location
- **Widgets**: Change `widgetsPath` for template location
- **Debugger**: Toggle `enableLocalDebugger` for development mode

## Database Migrations

SQLite migrations are stored in the `migrations_sqlite/` directory. Run migrations on startup or manually using Finch CLI tools.

## Development Features

### Hot Reload
The development server watches for changes in:
- Language files (`.json`) → Auto-generates Dart code
- Widget files (`.j2.html`) → Auto-generates Dart code
- Changes are pushed to connected clients automatically

### Local Debugger
Enable the local debugger in development mode to inspect:
- Request/response data
- Database queries
- MCP tool execution

## Internationalization

Add new languages in `lib/languages/` as JSON files:
```json
{
  "title": "Todo App",
  "add_todo": "Add Todo",
  "delete_todo": "Delete Todo"
}
```

The Dart code generator will automatically create language constants.

## Contributing

Please refer to the [Finch documentation](https://finchdart.com) for additional resources and examples.

## Resources

- [Finch Framework Documentation](https://pub.dev/packages/finch)
- [Model Context Protocol Spec](https://modelcontextprotocol.io)
- [Dart Language Guide](https://dart.dev/guides)
          