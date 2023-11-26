# issues ?


## test_pg_exec_issue - pg.exec() query execution errors - **RUNTIME ERROR: invalid memory access**

>Test application to demonstrate pg.exec() runtime error [with some queries]
>

### os:
```bash
Distributor ID: Debian
Description:    Debian GNU/Linux 12 (bookworm)
Release:        12
Codename:       bookworm
```

### v:
```bash
v --version
V 0.4.3 bc62c5c

./tcc.exe --version
tcc version 0.9.27 (x86_64 Linux)
```


### Run:
* You don't need a database - the system postgres is enough
* Set env variables! : TESTDB_HOST, TESTDB_USER, TESTDB_PASSWORD TESTDB

```bash
env TESTDB_HOST="postgres_host_ip" TESTDB_USER="user_name"  TESTDB_PASSWORD="password" TESTDB="database_name"  v run test_pg_exec_issue.v
```

* Result:
  
```bash
start
TESTDB_HOST: Option('...') | TESTDB_USER: Option('...') | TESTDB_PASSWORD: Option('...') | TESTDB: Option('...')

[pg.Row{
    vals: [Option('PostgreSQL 13.5 (Ubuntu 13.5-1.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, 64-bit')]
}]

7f499e971640 : at ???: RUNTIME ERROR: invalid memory access
/tmp/v_1000/../../../../../../home/user/bin/v/vlib/builtin/string.v:326: by string_clone
/tmp/v_1000/../../../../../../home/user/bin/v/vlib/builtin/string.v:1747: by string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4502: by indent__option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4498: by _option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4514: by indent_Array__option_string_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4533: by indent_db__pg__Row_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4487: by indent_Array_db__pg__Row_str
/tmp/v_1000/test_pg_exec_issue.tmp.c:4481: by Array_db__pg__Row_str
/tmp/v_1000/../../../../../../home/user/W7/Programowanie/v/postgres/test_lisbs/test_pg_exec_issue.v:53: by main__test
/tmp/v_1000/../../../../../../home/user/W7/Programowanie/v/postgres/test_lisbs/test_pg_exec_issue.v:66: by main__main
/tmp/v_1000/../../../../../../tmp/v_1000/test_pg_exec_issue.tmp.c:17092: by main
```


Compile(production):

```bash
v  -keepc -prod -show-c-output test_pg_exec_issue.v

======== C Compiler output ========
lto-wrapper: warning: using serial compilation of 3 LTRANS jobs
lto-wrapper: note: see the ‘-flto’ option documentation for more information
In function ‘vmemcpy’,
    inlined from ‘string_clone’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:12518:3,
    inlined from ‘string_trim’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:13725:10,
    inlined from ‘string_trim_space’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:13720:9,
    inlined from ‘print_backtrace_skipping_top_frames_linux.isra’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:9538:15:
/tmp/v_1000/test_pg_exec_issue.tmp.c:10311:24: warning: ‘memcpy’ specified bound between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
10311 |                 return memcpy(dest, const_src, n);
      |                        ^
In function ‘vmemcpy’,
    inlined from ‘string_clone’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:12518:3,
    inlined from ‘string_all_before’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:13965:10,
    inlined from ‘print_backtrace_skipping_top_frames_linux.isra’ at /tmp/v_1000/test_pg_exec_issue.tmp.c:9520:26:
/tmp/v_1000/test_pg_exec_issue.tmp.c:10311:24: warning: ‘memcpy’ specified bound between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
10311 |                 return memcpy(dest, const_src, n);
      |                        ^

=================================
```

> Same when I use gcc.
> It definitely worked properly in V 0.3.5
>
----
