module East
  class CLI::Backup
    attr_reader :options, :thor

    def initialize(options, thor)
      @options = options
      @thor    = thor
    end

    def run
      backup_root = Pathname(options[:directory] || ENV['HOME']) # backup to home directory if not specified
      unless backup_root.exist?
        puts "Backup directory: '#{backup_root}' not exist"
        exit 1
      end
      
      backup_dir = backup_root.join(Date.today.to_s)
      FileUtils.mkdir_p(backup_dir)
      FileUtils.cd(backup_dir) do
        # TODO prefix db2 command with full path when db2cmd is not on the path
        thor.run("db2look -d eastansy -l -e -o eastansy.ddl")
      end
      data_dir = backup_dir.join("db2move")
      FileUtils.mkdir_p(data_dir)
      FileUtils.cd(data_dir) do
        thor.run("db2move eastansy export -sn eastansy")
      end
    end
  end
end
