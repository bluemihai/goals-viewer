class User < ActiveRecord::Base
  extend Importable

  has_many :reviews
  has_many :goals, through: :reviews

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def github_path
    "http://github.com/#{name}"
  end

  def self.github_path(username)
    "http://github.com/#{username}"
  end

  def self.import_all
    member_hashes = github("https://api.github.com/orgs/GuildCrafts/members")
    member_hashes.each do |login_hash|
      User.create!(name: login_hash['login'], id: login_hash['id'], role: 'user')
    end
  end

end
