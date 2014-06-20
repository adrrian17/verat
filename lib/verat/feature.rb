require 'git'

module Verat
  class Feature
    def self.start(feature)
      puts "Creating branch: feature/#{feature}"

      repo = Git.open(Dir.pwd)
      repo.branch("feature/#{feature}").checkout

      puts "Branch created succesfuly. Current branch: feature/#{feature}"
    end

    def self.finish(feature, options)
      puts "Finishing feature: #{feature}"

      repo   = Git.open(Dir.pwd)
      branch = "feature/#{feature}"

      if repo.current_branch() != 'develop' and repo.is_branch?(branch)
        repo.checkout('develop')

        # Temporary fix until git adds options to the merge method
        system("git merge --no-ff #{branch}")
      else
        # Temporary fix until git adds options to the merge method
        system("git merge --no-ff #{branch}")
      end

      if options['delete'] then
        repo.branch("#{branch}").delete
        puts "Deleting branch: #{branch}"
      end

      puts "Finished succesfuly. Current branch: develop"
    end
  end
end
