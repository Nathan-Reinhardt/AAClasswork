require_relative 'questions_database.rb'
require_relative 'question'
require_relative 'user'

class QuestionLike

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    QuestionLike.new(like.first)
  end

  def self.num_likes_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(u.id) as num_likes
      FROM
        question_likes AS ql
      JOIN
        users AS u ON ql.user_id = u.id
      WHERE
        ql.question_id = ?
    SQL
    likers[0]['num_likes']
  end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.id, u.fname, u.lname
      FROM
        question_likes AS ql
      JOIN
        users AS u ON ql.user_id = u.id
      WHERE
        ql.question_id = ?
    SQL
    likers.map { |liker| User.new(liker) }
  end

  def self.liked_questions_for_user_id(user_id)
    liked_quests = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.id, q.title, q.body, q.associated_author
      FROM
        question_likes AS ql
      JOIN
        questions AS q ON ql.question_id = q.id
      WHERE
        ql.user_id = ?
    SQL
    liked_quests.map { |quest| Question.new(quest) }
  end

  attr_accessor :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end