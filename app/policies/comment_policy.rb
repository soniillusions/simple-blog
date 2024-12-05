class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.guest?
  end

  def update?
    user.author?(record)
  end

  def destroy?
    user.author?(record)
  end
end