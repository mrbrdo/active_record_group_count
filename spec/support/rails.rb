# minimum that we need for carrierwave to work

require 'active_record'
require 'rails/railtie'

module Rails
  def self.root
    Pathname.new(File.expand_path("../../", __FILE__))
  end

  def self.public_path
    Rails.root.join("tmp").to_s
  end
end

require 'active_record_group_count'
ActiveRecordGroupCount::Railtie.initializers.map(&:block).each(&:call)
