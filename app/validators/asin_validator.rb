class AsinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      response = HTTParty.get("http://www.amazon.com/dp/#{value}")
      record.errors.add attribute, '/ASIN inválido!' if response.code != 200
    end
  end
end
