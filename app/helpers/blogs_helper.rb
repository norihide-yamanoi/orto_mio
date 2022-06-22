module BlogsHelper
  def choose_new_or_edit_blog
    if action_name == 'new' || action_name == 'create'
      confirm_event_blogs_path
    elsif action_name == 'edit'
      event_blog_path
    end
  end
end
