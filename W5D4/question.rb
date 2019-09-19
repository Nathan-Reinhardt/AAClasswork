require_relative 'questions_database.rb'
require_relative 'user'
require_relative 'reply'

class Question

  def self.find_by_id(id)
    quest = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(quest.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM
        questions
      WHERE
        associated_author = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  attr_accessor :title, :body, :associated_author

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @associated_author = options['associated_author']
  end

  def author
    User.find_by_id(@associated_author)
  end

  def replies
    Reply.find_by_question_id(@id)
  end
  
end