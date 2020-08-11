# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  qtext   :string           not null
#  poll_id :integer          not null
#
class Question < ApplicationRecord
    validates :qtext, presence: true
    validates :poll_id, presence: true

    belongs_to :poll
    
    has_many :answer_choices

    has_many :responses,
        through: :answer_choices
end
