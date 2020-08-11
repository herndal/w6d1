# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  atext       :string           not null
#  question_id :integer          not null
#
class AnswerChoice < ApplicationRecord
    validates :atext, presence: true
    validates :question_id, presence: true
    
    belongs_to :question 

    has_many :responses


end 
