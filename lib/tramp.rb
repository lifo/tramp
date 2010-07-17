require 'eventmachine'
EM.epoll

require 'active_support'
require 'active_support/core_ext/class/inheritable_attributes'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/module/aliasing'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/kernel/reporting'
require 'active_support/concern'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/buffered_logger'

require 'tramp/evented_mysql'
require 'tramp/emysql_ext'
require 'mysqlplus'
require 'arel'
require 'tramp/arel_monkey_patches'
require 'active_model'

module Tramp
  VERSION = '0.1'

  mattr_accessor :logger

  autoload :Quoting, "tramp/quoting"
  autoload :Engine, "tramp/engine"
  autoload :Column, "tramp/column"
  autoload :Relation, "tramp/relation"

  autoload :Base, "tramp/base"
  autoload :Finders, "tramp/finders"
  autoload :Attribute, "tramp/attribute"
  autoload :AttributeMethods, "tramp/attribute_methods"
  autoload :Status, "tramp/status"
  autoload :Callbacks, "tramp/callbacks"

  def self.init(settings)
    Arel::Table.engine = Tramp::Engine.new(settings)
  end

  def self.select(query, callback = nil, &block)
    callback ||= block

    EventedMysql.select(query) do |rows|
      callback.arity == 1 ? callback.call(rows) : callback.call if callback
    end
  end
end
