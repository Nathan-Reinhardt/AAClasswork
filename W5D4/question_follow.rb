require_relative 'questions_database.rb'
require_relative 'question'
require_relative 'user'


class QuestionFollow

  def self.find_by_id(id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    QuestionFollow.new(follow.first)
  end

  def self.followers_for_question_id(question_id)
    follow_data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        u.id, u.fname, u.lname
      FROM
        question_follows AS qf
      JOIN
        users AS u ON qf.user_id = u.id
      WHERE
        question_id = ?
    SQL
    follow_data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    follow_data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        q.id, q.title, q.body, q.associated_author 
      FROM
        question_follows AS qf
      JOIN
        questions AS q ON qf.question_id = q.id
      WHERE
        user_id = ?
    SQL
    follow_data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    quests = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.id, q.title, q.body, q.associated_author
      FROM
        question_follows as qf
      JOIN
        questions as q ON qf.question_id = q.id
      GROUP BY
        qf.question_id
      ORDER BY
        COUNT(qf.question_id) DESC
      LIMIT
        ?
    SQL
    quests.map { |datum| Question.new(datum) }
  end

  attr_accessor :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end