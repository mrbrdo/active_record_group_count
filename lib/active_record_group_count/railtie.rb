module ActiveRecordGroupCount
  class Railtie < Rails::Railtie
    initializer "active_record_group_count.include_in_activerecord" do
      ActiveSupport.on_load :active_record do
        include ActiveRecordGroupCount::Scope
      end
    end
  end
end
