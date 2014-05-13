class Url < ActiveRecord::Base
  after_initialize :set_visit_count

  def set_visit_count
    self.visit_count ||= 0
  end

  validates :resource, presence: true,
                       format: { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/,
                                 message: "Not a valid URL"}
  validates :short_resource, uniqueness: true

end

