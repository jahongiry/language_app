teacher = User.find_or_create_by(email: 'teacher@gmail.com') do |user|
  user.password = 'teacher123'
  user.teacher = true
end

teacher.save
