class Admin::Menu < ActiveRecord::Base
	has_ancestry

	scope :all_by_order, -> { where(visible: true).order(id: :asc).reorder(weight: :asc) }
end
