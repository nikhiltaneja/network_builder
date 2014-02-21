module UsersHelper

  def validate_summary(user)
    if user.summary && !user.summary.empty?
      render partial: 'users/summary', locals: {user: user}
    end
  end

  def validate_jobs(user)
    if user.jobs
      render partial: 'users/jobs', locals: {user: user}
    end
  end

  def validate_degrees(user)
    if user.degrees
      render partial: 'users/degrees', locals: {user: user}
    end
  end
end
