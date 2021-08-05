class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :past_today
  validates :memo, length: { maximum: 500 }
  

  def past_today
      errors.add(:end_date, 'は今日以降の日付で選択してください') if end_date.nil? || end_date < Date.today
  end
  
end
