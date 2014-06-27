require 'git'

module Verat
  class Feature
    def self.process(cmd, feature, options)
      @repo = Git.open(Dir.pwd)

      self.start(@repo, feature) if cmd == 'start'
      self.finish(@repo, cmd, options) if cmd == 'finish'
    end

    def self.start(repo, feature)
      branch = "feature/#{feature}"

      if repo.current_branch == branch
        puts "Already on feature/#{feature}"
        exit 0
      elsif repo.is_branch?(branch)
        puts "Feature branch '#{branch}' already exists..."
        puts "Switching to this branch..."
        repo.branch(branch).checkout
        exit 0
      end

      begin
        repo.branch(branch).checkout

        raise "Error: couldn't create branch 'feature/#{feature}'" unless repo.is_branch?(branch)

        puts "Summary:".colorize(:blue).underline
        puts "Created branch 'feature/#{feature}'"
        puts "When the feature is ready run: verat feature finish #{feature}"
      rescue Exception => e
        puts e.message
      end
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

      if options['delete']
        repo.branch(branch).delete
        puts "Deleting branch: #{branch}"
      end

      puts "Finished succesfuly. Current branch: develop"
    end
  end
end
