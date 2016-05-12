rails_env = ENV['RAILS_ENV'] || 'production'

app_root = '/home/deployer/biodiversity/current'
working_directory app_root

# 16 workers and 1 master
worker_processes (rails_env == 'production' ? 4 : 1)

# Load app into the master before forking workers for super-fast worker spawn times
preload_app true

# Restart any workers that haven't responded in 30 seconds
timeout 30

# Listen on a Unix data socket
listen '/home/deployer/biodiversity/shared/sockets/unicorn.sock', :backlog => 2048
pid '/home/deployer/biodiversity/shared/pids/unicorn.pid'
stderr_path '/home/deployer/biodiversity/shared/log/unicorn.log'
stdout_path '/home/deployer/biodiversity/shared/log/unicorn.log'

# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

# To use the latest Gemfile
before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{app_root}/Gemfile"
end

before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end