class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  has_many :goals
  has_many :tasks, through: :goals

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       #binding.pry
        user.provider = auth.provider
        user.uid = auth.uid
       #user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end
  end

  def most_completed_tasks
    most = self.goals.first.tasks.complete.count
    @goal_with_most = self.goals.first
    self.goals.each do |goal|
      if goal.tasks.complete.count > most
        @goal_with_most = goal
      end
    end
    @goal_with_most
  end
end
