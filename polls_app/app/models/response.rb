# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#
class Response < ApplicationRecord
    validates :answer_choice_id, presence: true
    validates :user_id, presence: true
    validate :not_duplicate_response

    belongs_to :respondent,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :answer_choice

    has_one :question,
        through: :answer_choice
    
    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    private
    def respondent_already_answered?
        sibling_responses.exists?(user_id: self.user_id)
    end

    def not_duplicate_response
        errors[:duplicate_response] << 'can\'t respond twice' if respondent_already_answered?
    end
end