module ActiveRecordGroupCount
  module Scope
    extend ActiveSupport::Concern

    module ExtensionMethods
      def count(*args)
        scope = except(:select).select("1")
        query = "SELECT count(*) AS count_all FROM (#{scope.to_sql}) x"
        ActiveRecord::Base.connection.execute(query).first.try(:[], "count_all").to_i
      end
    end

    module ClassMethods
      def returns_count_sum
        scoped.extending(ExtensionMethods)
      end
    end
  end
end
