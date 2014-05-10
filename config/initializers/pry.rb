# coding: utf-8
# rubocop:disable Delegate,HandleExceptions

begin
  require 'pry'

  module Rails
    class Console
      class IRB
        def self.start
          Pry.start
        end
      end
    end
  end
rescue LoadError
end
