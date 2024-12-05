class PostDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    created_at.strftime('%B %d, %Y %H:%M')
  end
end
