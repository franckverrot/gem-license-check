require 'rubygems/command_manager'
require 'gem/licenses'
Gem::CommandManager.instance.register_command :licenses

module Gem
  module Commands
    class LicensesCommand < Command
      def initialize
        super 'licenses', "Licenses reporter and checker"
      end

      def arguments
        <<-EOS.gsub(/^ *\|/, '')
          |GEMFILE_LOCK Path to a Gemfile.lock
        EOS
      end

      def usage
        "#{program_name} GEMFILE_LOCK"
      end

      def default_str
        ''
      end

      def description
        <<-EOS.gsub(/^ *\|/, '')
          |License checker and reporter.
          |
          | * Prints a summary of all the licenses that a project uses
          | * Make use of exit statuses to be integrated in a CI build
        EOS
      end

      def execute
        begin
          paths = options.fetch(:args, ['./Gemfile.lock'])

          paths.each do |path|
            runner = Gem::Licenses::Runner.new(gemfile_lock_path: path)
            runner.run
          end
        rescue Gem::Licenses::UsageError
          STDERR.puts "USAGE: #{usage}"
          terminate_interaction(1)
        rescue Gem::Licenses::Error => e
          STDERR.puts e.message
          terminate_interaction(1)
        rescue => exception
          puts "Unexpected error!"
          STDERR.puts "#{exception.class}: #{exception.message}"
          exception.backtrace.each do |line|
            STDERR.puts "  #{line}"
          end
        end
      end
    end
  end
end
