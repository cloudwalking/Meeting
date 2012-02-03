# Import in official clean and clobber tasks
require 'rake/clean'
CLEAN.include("db/data.db")

namespace :db do
  require "sequel"

  desc "Bring database schema up to par."
  task :migrate do
    db_url = ENV['DATABASE_URL'] || "sqlite://db/data.db"
    migrations_dir = "./db/migrations/"

    puts "Migrating from '#{migrations_dir}' into '#{db_url}'."

    ret = Kernel.system("sequel -m #{migrations_dir} #{db_url}");

    if ret
      puts "Database migrated."
    else
      puts "Database migration failed."
    end

    puts "Database built."
  end

  desc "Delete the database"
  task :erase do
    DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
    DB.drop_table(:meetings)
    DB.drop_table(:actions)
    DB.drop_table(:schema_info)
  end

  desc "Dumps the database"
  task :dump do
    DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')

    puts "Meetings Schema"
    p DB.schema :meetings

    puts "Actions Schema"
    p DB.schema :actions
  end
end
