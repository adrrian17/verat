require 'git'

module Verat
  class Feature
    def self.start(feature)
      puts "Creating branch: feature/#{feature}"

      repo = Git.open(Dir.pwd)
      repo.branch("feature/#{feature}").checkout

      puts "Branch created succesfuly. Current branch: feature/#{feature}"
    end
  end
end
