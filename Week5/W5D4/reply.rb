require_relative 'questions_database.rb'
require 'byebug'
require_relative 'user'
require_relative 'question'

class Reply

  def self.find_by_id(id)
    rep = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(rep.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM
        replies
      WHERE
        author_reference_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM
        replies
      WHERE
        question_reference_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  attr_accessor :question_reference_id, :parent_reference_id, :author_reference_id, :body

  def initialize(options)
    @id = options['id']
    @question_reference_id = options['question_reference_id']
    @parent_reference_id = options['parent_reference_id']
    @author_reference_id = options['author_reference_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@author_reference_id)
  end

  def question
    Question.find_by_id(@question_reference_id)
  end

  def parent_reply
    return puts 'This is the first reply' if @parent_reference_id.nil?
    Reply.find_by_id(@parent_reference_id)
  end

  def child_replies
    replies = Reply.find_by_question_id(@question_reference_id)
    replies.each do |reply|
      parent_id = reply.parent_reference_id
      if parent_id == @id && Reply.find_by_id(parent_id).body == @body
        return reply
      end
    end
    return puts 'There are no replies'
  end

end

#puts Reply.find_by_user_id(5)