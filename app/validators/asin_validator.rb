class AsinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      response = HTTParty.get("http://www.amazon.com/dp/#{value}")
      if response.code != 200
        record.errors.add attribute, "/ASIN inválido!"
      end
    end
  end
end
