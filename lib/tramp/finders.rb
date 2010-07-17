module Tramp
  module Finders

    delegate :all, :first, :each, :where, :select, :group, :order, :limit, :offset, :to => :relation

    def [](attribute)
      arel_table[attribute]
    end

    def arel_table
      @arel_table ||= Arel::Table.new(table_name)
    end

    def relation
      Relation.new(self, arel_table)
    end

    private

    def table_name
      self.to_s.demodulize.underscore.pluralize
    end

  end
end
