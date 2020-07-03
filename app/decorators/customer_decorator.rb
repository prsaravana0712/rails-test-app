class CustomerDecorator < ApplicationDecorator
  delegate_all

  def name
    get_value object.name
  end

  def email
    get_value object.email
  end

  def mobile
    get_value object.mobile
  end

  def city
    get_value object.city
  end

  private
    def get_value value
      value.present? ? value : "NA"
    end

end
