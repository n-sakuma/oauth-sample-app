class ExternalApplication < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |app|
      app.provider = auth["provider"]
      app.uid = auth["uid"]
      app.name = auth["info"]["name"]
    end
  end
end
