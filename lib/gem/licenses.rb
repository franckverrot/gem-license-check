require 'pry'
require 'bundler'
require 'gem/licenses/errors'

module Gem
  module Licenses
    class Runner
      def initialize(gemfile_lock_path:)
        self.gemfile_lock_path = gemfile_lock_path
        self.logger = $stderr
        self.output = $stdout
      end

      def run
        lockfile = Bundler::LockfileParser.new(Bundler.read_file(gemfile_lock_path))
        licenses = Hash.new { |k,v| k[v] = [] }

        lockfile.specs.map do |spec|
          gem_name = spec.name
          begin
            mat = spec.__materialize__
            mat.licenses.each do |license_name|
              licenses[license_name] << spec.name
            end
          rescue => e
            logger.puts "[gem-licenses] Couldn't extract the gem details for #{spec}. Error: #{e.message}"
            licenses['N/A'] << gem_name
          end
        end

        format = "%40s | %10s | %s"
        output.puts format % ["License_name", "# of gems", "Gems"]
        licenses.map do |license_name, gems|
          { license_name: license_name, gem_count: gems.count, gems: gems.join(", ") }
        end.sort { |a ,b| b[:gem_count] <=> a[:gem_count] }.each do |vars|
          output.puts format % vars.values_at(:license_name, :gem_count, :gems)
        end

        lockfile
      end

      private
      attr_accessor :gemfile_lock_path, :logger, :output
    end
  end
end
