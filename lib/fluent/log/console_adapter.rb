#
# Fluentd
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

require 'console/serialized/logger'

module Fluent
  class Log
    class ConsoleAdapter < Console::Terminal::Logger
      def self.wrap(logger)
        _, level = Console::Logger::LEVELS.find { |key, value|
          if logger.level <= 0
            key == :debug
          else
            value == logger.level - 1
          end
        }
        Console::Logger.new(ConsoleAdapter.new(logger), level: level)
      end

      def initialize(logger)
        @logger = logger
        super(StringIO.new, verbose: false)
      end

      def call(subject = nil, *arguments, name: nil, severity: 'info', **options, &block)
        if LEVEL_TEXT.include?(severity.to_s)
          level = severity
        else
          @logger.warn("Unknown severity: #{severity}")
          level = 'warn'
        end

        @io.truncate(0)
        super
        @logger.send(severity, @io.string.chomp)
      end
    end
  end
end
