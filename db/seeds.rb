# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tags = %w[
  ruby
  rails
  web_dev
  full_stack
  backend
  frontend
  apis
  code_opt
  tdd
  mvc
  activerecord
  db_design
  code_review
  deployment
  gems
  devops
  agile
  design_patterns
  ci
  js_for_rails
  job_search
  interviews
  resume_tips
  interview_tips
  coding_challenges
  technical_interview
  soft_skills
  career_growth
  portfolio
  freelancing
  remote_work
  interview_preparation
  technical_skills
  coding_interviews
  personal_projects
  networking
  job_offer
  salary_negotiation
  mentorship
  job_hunting_tips
  code_quality
  developer_community
  online_courses
  job_market
]

tags.each do |tag|
  Tag.create(title: tag)
end
