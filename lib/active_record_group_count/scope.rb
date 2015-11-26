module ActiveRecordGroupCount
  module Scope
    extend ActiveSupport::Concern

    module ExtensionMethods
      def count(*args)
        scope = except(:select).select("1")
        scope_sql = if scope.klass.connection.respond_to?(:unprepared_statement)
          scope.klass.connection.unprepared_statement { scope.to_sql }
        else
          scope.to_sql
        end
        query = "SELECT count(*) AS count_all FROM (#{scope_sql}) x"
        ActiveRecord::Base.connection.execute(query).first.try(:[], "count_all").to_i
      end
    end

    module ClassMethods
      def returns_count_sum
        all.extending(ExtensionMethods)
      end
    end
  end
end
