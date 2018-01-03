class CatRentalRequest < ApplicationRecord

  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: self.cat_id)
      .where("start_date < ?", self.end_date)
      .where("end_date > ?", self.start_date)
      # .where.not(id: self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    !overlapping_approved_requests.exists?
  end
end
