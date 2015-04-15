class Admin::StatisticsController < AuthController
	def index
		$visits        = Admin::Visit.all
		$days_pv       = Admin::Visit.days_pv_by_this_mounth.to_a
		$browser_rates = Admin::Visit.days_browser_rates.to_json
		$device_rates  = Admin::Visit.days_device_retes.to_json
	end
end
