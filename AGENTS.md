# AGENTS.md — Oracle APEX / PL/SQL Project

## Purpose
Defines coding, deployment, and testing conventions for Codex agents working in this Oracle APEX + PL/SQL repository.

---

## Project Context
- **Primary stack:** Oracle APEX 24.2, Oracle Database 23ai
- **Languages:** PL/SQL, SQL, JavaScript (Dynamic Actions)
- **Environment:** APEX workspaces with version-controlled scripts

---

## Folder Structure
```
/PLSQL/               -- Core PL/SQL packages, procedures, functions
/APEX/                -- APEX application exports
/TABLES/              -- Table Definitions and Creation Scripts
/SCRIPTS/             -- Deployment SQLs, DDL, DML
/VIEWS/               -- View and SQL Macro Definitions
```

---

## Coding Conventions

### PL/SQL
- Use package-based architecture.
- Prefer `%TYPE` and `%ROWTYPE` for variable declarations.
- No hardcoded schema names.
- Use the built in APEX PL/SQL Debugging API apex_debug for debigging.
- Exception handling: always include `WHEN OTHERS THEN apex_debug.error('%s > Unhandled Error [%s]', lc_log_module, SQLERRM); RAISE;`

### Naming
| Object Type | Suffix | Example |
|--------------|---------|---------|
| Table        |         | CUSTOMERS |
| View         | _V      | ACTIVE_USERS_V |
| Package      | _PK     | CUSTOMER_PK |

### PL/SQL Formatting
- Indent with 2 spaces.
- Uppercase SQL keywords.
- Lowercase variables.
- Align `=>` in parameter lists.
- Use consistent comment blocks (`--` for inline, `/* ... */` for multi-line).

### SQL Statement Formatting
- Indent with two spaces; keyword lines start flush left for readability.
- Write SELECT, FROM, WHERE, AND, etc. in uppercase, one clause per line.
- Align table aliases when listing multiple tables, e.g. , oe_order_lines_all ool.
- Align comparison operators in the WHERE block so = signs line up vertically.
- Keep comma-prefixed joins (FROM … , …) on their own lines with the comma leading, as shown.
- End each statement with a semicolon.

---

## Testing
- TBD
---

## Deployment
- Do not edit APEX export files.

---

## Agent Behavior Guidelines
- Prefer creating or updating **package specs first**, then bodies.
- Include comments and parameter descriptions in headers.
- If a table or column is referenced but undefined, create a stub DDL under `/TABLES/stubs.sql`.
- For APEX changes, describe intended UI effect in comments (no HTML generation).
- **NEVER** perform DDL or DML when using Tools.

---

## Example Commit Messages
```
feat(orders_pk): add order validation logic
fix(create_order): handle NULL email edge case
```

