class Receipt < ApplicationRecord
  belongs_to :payment, optional: true

  validates_presence_of :concept, if: :nil_payment?

  def self.to_csv
    attributes = %w{name value formatted_created_at_date receipt_month}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |receipt|
        csv << attributes.map{ |attr| receipt.send(attr) }
      end
    end
  end

  def formatted_created_at_date
    created_at.to_s(:db)
  end

  def receipt_month
    month.capitalize
  end

  private

  def nil_payment?
    payment_id.nil?
  end
end
