require 'json'
require 'io/console'
require 'colorize'

module NewGit

  extend self
  def init(args)
    if args.any?
      build_new = true
      repo_name = args.pop
    else
      build_new = false
      repo_name = Dir.getwd.split('/').last
    end

    creds = get_credentials
    response = `curl -u "#{creds[:username]}:#{creds[:password]}" https://api.github.com/user/repos -d '{"name":"'#{repo_name}'"}'`
    git_url = JSON.parse(response)
    if git_url['message'] || git_url['errors']
      puts git_url['message'].colorize(color: :red)
      git_url['errors'] && git_url['errors'].each do |err|
        puts "#{err['message']}".colorize(color: :red)
      end
    else
      if build_new
        `git clone #{git_url['clone_url']}`
      else
        `echo "# #{repo_name}" >> README.md`
        `git init`
        `git add .`
        `git commit -m "initial commit"`
        `git remote add origin #{git_url['clone_url']}`
      end
      puts "You successfully created new git repo at #{git_url['clone_url']}".colorize(color: :green)
    end
  end

  def get_credentials
    {username: get_user, password: get_pw }
  end

  def get_user
    print "github username > "
    username = STDIN.gets.chomp
  end

  def get_pw
    print "github password > "
    pw = STDIN.noecho(&:gets).chomp
  end
end
