require 'git'

module Verat
  class Hotfix
    def self.start(hotfix)
      puts "Creating branch: hotfix-#{hotfix}"

      repo = Git.open(Dir.pwd)
      repo.branch("hotfix-#{hotfix}").checkout

      puts "Branch created succesfuly. Current branch: hotfix-#{hotfix}"
    end

    def self.finish(hotfix, options)
      puts "Finishing hotfix: #{hotfix}"

      repo   = Git.open(Dir.pwd)
      branch = "hotfix-#{hotfix}"

      if repo.current_branch() != 'master' and repo.is_branch?(branch)
        repo.checkout('master')

        # Temporary fix until git adds options to the merge method
        status = system("git merge --no-ff #{branch}")
        if status
          repo.checkout('develop')
          system("git merge --no-ff #{branch}")
        end
      else
        # Temporary fix until git adds options to the merge method
        status = system("git merge --no-ff #{branch}")
        if status
          repo.checkout('develop')
          system("git merge --no-ff #{branch}")
        end
      end

      if options['delete'] then
        repo.branch("#{branch}").delete
        puts "Deleting branch: #{branch}"
      end

      puts "Finished succesfuly. Current branch: develop"
    end
  end
end
