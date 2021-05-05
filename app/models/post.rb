class Post < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :last, presence: true
    validate :last_check

    def last_check
        errors.add(:last, "は今日以降の日付で選択してください") if last && last <= Date.today
    end
end
