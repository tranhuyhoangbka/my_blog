class Project < ActiveRecord::Base
  scope :get_project_for_normal_user, ->{limit(2)}
  scope :for, ->user{user.admin? ? Project.all : Project.get_project_for_normal_user}
end
