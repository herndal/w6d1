class CreateEveryTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    drop_table :polls
    drop_table :questions
    drop_table :answer_choices
    drop_table :responses
    
    create_table :users do |t|
      t.string :username, null: false, unique: true
    end

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
    end

    create_table :questions do |t|
      t.string :qtext, null: false
      t.integer :poll_id, null: false
    end

    create_table :answer_choices do |t|
      t.string :atext, null: false
      t.integer :question_id, null: false
    end

    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :user_id, null: false
    end

    
    add_index :polls, :user_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, :answer_choice_id
    add_index :responses, :user_id
  end
end
