class Visit < ActiveRecord::Base
  
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user

  scope :find_by_this_month, ->	{ where("MONTH(started_at) = #{Time.now.month}") }
 
  scope :days_pv_by_this_mounth, -> { find_by_this_month.group("DAY(started_at)").count }
  scope :days_browser_rates, ->	{ find_by_this_month.group(:browser).count.to_a.map{ |label,data| { label: label, data: data } } }
  scope :days_device_retes, -> { find_by_this_month.group(:device_type).count.to_a.map{ |label,data| { label: label, data: data } }}
end
