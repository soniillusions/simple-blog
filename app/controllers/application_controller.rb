class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authentication
  include Authorization

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end
end
