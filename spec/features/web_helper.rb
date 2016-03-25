def add_link(title=nil,url=nil,tag=nil)
  visit '/links/new'
  fill_in(:title, with: title)
  fill_in(:url, with: url)
  fill_in(:tag, with: tag)
  click_button("Submit")
end

# def add_socialmedia_link
#   visit '/links/new'
#   fill_in(:title, with: "Twitter")
#   fill_in(:url, with: "www.Twitter.com")
#   fill_in(:tag, with: "socialmedia")
#   click_button("Submit")
# end

# def add_news_link
#   visit '/links/new'
#   fill_in(:title, with: "BBC")
#   fill_in(:url, with: "www.BBC.com")
#   fill_in(:tag, with: "news")
#   click_button("Submit")
# end

# def add_multi_tag_link
#   visit '/links/new'
#   fill_in(:title, with: "Techcrunch")
#   fill_in(:url, with: "www.techcrunch.com")
#   fill_in(:tag, with: "news digital science")
#   click_button("Submit")
# end

def signup(name=nil, email=nil, password=nil, password_confirmation=nil)
  visit('/users/signup')
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button("Sign Up")
end
