class AddColumnForCatRentalRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :cat_rental_requests, :start_date, :date
    add_column :cat_rental_requests, :end_date, :date
  end
end
