# encoding: utf-8

module East
  module DBRunnable
    def db_cmd(cmd = nil, db: 'eastst', user: 'db2inst1', passwd: 'db2inst1')
      connect_sql = if user
                      "db2 connect to #{db} user #{user} using #{passwd}"
                    else
                      "db2 connect to #{db}"
                    end
      system(connect_sql)
      cmd ||= yield
      system(cmds)
    end

    def db_pipe_cmd(db_name, schema, user: nil, passwd: nil, &cmds)
      Open3.popen2e("~/sqllib/bin/db2") do |stdin, stdout_err, wait_thr|
        # prepare database connection
        connect_sql = "connect to #{db_name}"
        connect_sql << " user #{user} using #{passwd}" if user
        stdin.puts(connect_sql)
        stdin.puts("set current schema=#{schema}")

        # run the db commands
        stdin.puts(cmds.call)
        stdin.close

        wait_thr.value
      end
    end
    
  end

end
