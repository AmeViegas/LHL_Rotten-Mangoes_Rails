class Movie < ApplicationRecord
  has_many :reviews

  # activerecords scope
  scope :with_title, -> (title) { where("title like ?", title) }
  scope :with_director, -> (director) {where("director like ?", director)}

  scope :short, -> { where("runtime_in_minutes BETWEEN ? AND ?", "0","90") }
  scope :medium, -> { where("runtime_in_minutes BETWEEN ? AND ?", "90","120") }
  scope :long, -> { where("runtime_in_minutes BETWEEN ? AND ?", "120","999999") }

  # validations
  validates :title,
  presence: true

  validates :director,
  presence: true

  validates :runtime_in_minutes,
  numericality: { only_integer: true }

  validates :description,
  presence: true

  validates :release_date,
  presence: true

  validate :release_date_is_in_the_past

  mount_uploader :image, ImageUploader

  def review_average
    return 0 if reviews.size == 0
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
