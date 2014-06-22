require 'git'

module Verat
  class Release
    def self.start(release)
      puts "Creating branch: release/#{release}"

      repo = Git.open(Dir.pwd)
      repo.branch("release/#{release}").checkout

      puts "Branch created succesfuly. Current branch: release/#{release}"
    end

    def self.finish(release, options)
      puts "Finishing release: #{release}"

      repo   = Git.open(Dir.pwd)
      branch = "release/#{release}"

      if repo.current_branch() != 'master' and repo.is_branch?(branch)
        repo.checkout('master')

        # Temporary fix until git adds options to the merge method
        status = system("git merge --no-ff #{branch}")
        if status
          puts "Creating release tag: #{release}"
          repo.add_tag("#{release}",  {:a => true, :message => "v#{release}"})

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
        puts "Deleting release branch: #{branch}"
      end

      puts "Finished succesfuly. Current branch: develop"
    end
  end
end
