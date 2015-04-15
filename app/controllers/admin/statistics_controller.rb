class Admin::StatisticsController < AuthController
	def index
		$visits        = Visit.all
		$days_pv       = Visit.days_pv_by_this_mounth.to_a
		$browser_rates = Visit.days_browser_rates.to_json
		$device_rates  = Visit.days_device_retes.to_json
	end
end
