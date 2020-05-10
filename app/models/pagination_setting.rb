class PaginationSetting
  include ActiveModel::Serialization

  attr_accessor :per_page, :current_page, :records, :total, :serializer, :options

  def initialize(per_page, current_page, records, total, serializer, options)
    self.per_page = per_page
    self.current_page = current_page
    self.records = records
    self.total = total
    self.serializer = serializer
    self.options = options
  end

  def total_pages
    (total.to_f / per_page.to_f).ceil
  end

  def serialized_records
    records.map do |record|
      serializer.new(record, scope: options)
    end
  end

  def self.model_name
    'PaginationSetting'
  end
end