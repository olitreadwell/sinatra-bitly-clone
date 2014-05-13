class Url < ActiveRecord::Base
  after_initialize :set_visit_count

  def set_visit_count
    self.visit_count ||= 0
  end

  before_save :set_short_url

  def create_short_url
    #method that will generate a "random" URL
    only_letters = (self.resource).chars.select { |char| char =~ /[a-zA-Z]/ }
    number_array = (0..9).to_a.sample(only_letters.length)
    combined_array = only_letters + number_array
    end_of_short_url = combined_array.sample(7).join("")
    return "#{end_of_short_url}"
  end

  def set_short_url
    self.short_resource = create_short_url
  end

  def increment_visit_count
    self.visit_count +=1
  end

  validates :resource, presence: true,
                       format: { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/,
                                 message: "Not a valid URL"}
  validates :short_resource, uniqueness: true

end

