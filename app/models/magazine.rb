class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions  

  def email_list 
    self.readers.map {|r| r.email}.join(';')
  end

  def self.most_popular 
    filtered =  Magazine.all.map {|m| m.subscriptions }.select {|a,b| a <=> b}.flatten.first
    Magazine.find(filtered.magazine_id)
  end

end