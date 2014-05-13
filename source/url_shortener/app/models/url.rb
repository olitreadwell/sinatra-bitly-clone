class Url < ActiveRecord::Base
  after_initialize :set_visit_count

  def set_visit_count
    self.visit_count ||= 0
  end

  validates :resource, presence: true
  validates :short_resource, uniqueness: true


end

