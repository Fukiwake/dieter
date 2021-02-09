module UsersHelper
  
  def get_from_birthday(age)
    Date.today.strftime("%Y%m%d").to_i - age.to_i * 10000
  end
  
  def get_to_birthday(age)
    Date.today.strftime("%Y%m%d").to_i - age.to_i * 10000 - 9999
  end
  
end
