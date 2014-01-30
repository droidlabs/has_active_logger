require 'yell'
require 'active_support'
require 'active_support/core_ext/kernel/reporting'
require 'active_support/inflector'
require 'json'

module HasActiveLogger
  module Mixin
    extend ActiveSupport::Concern

    included do
      class << self
        def logger
          @logger ||= Yell.new do |l|
            l.adapter :datefile, log_file,
              level: (:debug..:fatal),
              format: Yell.format( "%d [%L] #%M at %F:%n\n%m\n\n", "%H:%M:%S" ),
              symlink: false,
              keep: 4
          end
        end

        def format_message(message)
          case message
            when String
              message
            when Hash, Array
              JSON::pretty_generate message
            else message.inspect
          end
        end

        private
          def log_file
            path = File.join(rails_log_path, "#{self.name.underscore}.log")
            FileUtils.mkdir_p File.dirname(path)
            path.to_s
          end

          def rails_log_path
            File.join(Rails.root, 'log', Rails.env)
          end
      end

      def logger
        self.class.logger
      end

      def format_message(message)
        self.class.format_message(message)
      end
    end

  end
end
