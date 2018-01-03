class ModifyColumnForCatRentalRequest < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cat_rental_requests, :start_date, false
    change_column_null :cat_rental_requests, :end_date, false
  end
end
