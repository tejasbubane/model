require_relative 'entity_name'
require 'hanami/utils/string'

module Hanami
  module Model
    # Conventional name for relations.
    #
    # Given a repository named <tt>SourceFileRepository</tt>, the associated
    # relation will be <tt>:source_files</tt>.
    #
    # @since x.x.x
    # @api private
    class RelationName < EntityName
      # @param name [Class,String] the class or its name
      # @return [Symbol] the relation name
      #
      # @since x.x.x
      # @api private
      def self.new(name)
        Utils::String.new(super).underscore.pluralize.to_sym
      end
    end
  end
end