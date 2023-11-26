import os
import db.pg

const query_str  =
[
"select version();",
"

SELECT ischema.table_schema, c.relname, a.attname, t.typname, t.typalign, t.typlen
  FROM pg_class c
  JOIN information_schema.tables ischema on ischema.table_name = c.relname
  JOIN pg_attribute a ON (a.attrelid = c.oid)
  JOIN pg_type t ON (t.oid = a.atttypid)
WHERE
    /* ischema.table_schema not in ('information_schema', 'pg_catalog') and */
    a.attnum >= 0
"

]


fn connect() ? pg.DB  {

    i_connection :=
        pg.connect(pg.Config {
            host     : os.getenv_opt('TESTDB_HOST') or {'127.0.0.1'}

            port     : 5432
            user     : os.getenv_opt('TESTDB_USER') or {   'postgres' }
            password : os.getenv_opt('TESTDB_PASSWORD') or { 'secret' }
            dbname   : os.getenv_opt('TESTDB') or {'postgres'}
            })
        or {
            eprintln('Failed to connect')
		    eprintln(err)
            return none
        }

    return i_connection
}

fn test() !{

    mut i_engine := connect() or { println('Failed to connect. \n ${err}'); return }
    defer {
        i_engine.close()
    }

    mut i_rows := i_engine.exec(query_str[0])!
    println('${i_rows}')

    i_rows = i_engine.exec(query_str[1])!
    println('${i_rows}')

    i_rows = i_engine.exec(query_str[2])!
    println('${i_rows}')

}



fn main () {

    println('start')
    println('TESTDB_HOST: ${os.getenv_opt("TESTDB_HOST")} | TESTDB_USER: ${os.getenv_opt("TESTDB_USER")} | TESTDB_PASSWORD: ${os.getenv_opt("TESTDB_PASSWORD")} | TESTDB: ${os.getenv_opt("TESTDB")}')

    test()!
}
