def start_with_tag
  visit '/links/new'
  fill_in(:title, with: "Facebook")
  fill_in(:url, with: "www.facebook.com")
  fill_in(:tag, with: "socialmedia")
  click_button("Submit")
end

def add_socialmedia_link
  visit '/links/new'
  fill_in(:title, with: "Twitter")
  fill_in(:url, with: "www.Twitter.com")
  fill_in(:tag, with: "socialmedia")
  click_button("Submit")
end

def add_news_link
  visit '/links/new'
  fill_in(:title, with: "BBC")
  fill_in(:url, with: "www.BBC.com")
  fill_in(:tag, with: "news")
  click_button("Submit")
end

def add_multi_tag_link
  visit '/links/new'
  fill_in(:title, with: "Techcrunch")
  fill_in(:url, with: "www.techcrunch.com")
  fill_in(:tag, with: "news digital science")
  click_button("Submit")
end

def signup
  visit('/')
  fill_in(:name, with: "Sachin")
  fill_in(:email, with: "sachin_rocks@gmail.com")
  fill_in(:password, with: "qw12er34")
  fill_in(:password_confirmation, with: "qw12er34")
  click_button("Sign Up")
end

def signup_wrong
    visit('/')
  fill_in(:name, with: "Sachin")
  fill_in(:email, with: "sachin_rocks@gmail.com")
  fill_in(:password, with: "qw12er34")
  fill_in(:password_confirmation, with: "qw12e")
  click_button("Sign Up")
end

def signup_wrong_email
  visit('/')
  fill_in(:name, with: "Sachin")
  #fill_in(:email, with: "sachin_rocks@gmail.com")
  fill_in(:password, with: "qw12er34")
  fill_in(:password_confirmation, with: "qw12er34")
  click_button("Sign Up")
end