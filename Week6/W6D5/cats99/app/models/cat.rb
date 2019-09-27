class Cat < ApplicationRecord

  validates :birth_date, :color, :name, :sex, :description, presence: true

  validates :color, inclusion: { in: %w(red orange yellow green blue purple) }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    now = Date.today
    now.year - self.birth_date.year - ((now.month > self.birth_date.month || (now.month == self.birth_date.month && now.day >= self.birth_date.day)) ? 0 : 1)
  end
end