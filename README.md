# issues

## test_pg_exec_issue - pg.exec() query execution errors - **RUNTIME ERROR: invalid memory access**

Run:
* You don't need a database - the system postgres is enough
* Set env variables! : TESTDB_HOST, TESTDB_USER, TESTDB_PASSWORD TESTDB

```bash
env TESTDB_HOST="host_ip" TESTDB_USER="user_name"  TESTDB_PASSWORD="password" TESTDB="database_name"  ./test_pg_exec_issue
```

Result:
```bash
start
TESTDB_HOST: Option('...') | TESTDB_USER: Option('...') | TESTDB_PASSWORD: Option('...') | TESTDB: Option('...')

[pg.Row{
    vals: [Option('PostgreSQL 13.5 (Ubuntu 13.5-1.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, 64-bit')]
}]

7f499e971640 : at ???: RUNTIME ERROR: invalid memory access
/tmp/v_1000/../../../../../../home/bruno/bin/v/vlib/builtin/string.v:326: by string_clone
/tmp/v_1000/../../../../../../home/bruno/bin/v/vlib/builtin/string.v:1747: by string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4502: by indent__option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4498: by _option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4514: by indent_Array__option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4533: by indent_db__pg__Row_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4487: by indent_Array_db__pg__Row_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4481: by Array_db__pg__Row_str
/tmp/v_1000/../../../../../../home/bruno/W7/Programowanie/v/postgres/test_lisbs/test_pg_exec_issue.v:53: by main__test
/tmp/v_1000/../../../../../../home/bruno/W7/Programowanie/v/postgres/test_lisbs/test_pg_exec_issue.v:66: by main__main
/tmp/v_1000/../../../../../../tmp/v_1000/test_pg_exec_issue.tmp.c:17092: by main
```
