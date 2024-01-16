module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the ndefleng home page$/
      root_path

    when /^the promoteurs page$/
      promoteurs_path


    when /^the list of ecuries$/
      ecuries_path

    when /^the admin page$/
     admin_dashboard_path

    when /^the lutteurs page$/
      lutteurs_path
    when /^devenir membre$/
      new_user_path

    when /^login page$/
      new_session_path

    when /^the galas page$/
      galas_path

    when /^the ndefleng calendar page$/
      calendar_path

    when /^the amateurs page$/
      users_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
