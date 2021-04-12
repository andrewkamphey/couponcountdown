task :reset_db => :environment do
    puts "updating database..."
    heroku run pg:reset
    heroku run db:seed db:migrate restart
    puts "done updating database"
end 