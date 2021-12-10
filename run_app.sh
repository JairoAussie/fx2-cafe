echo $1
#remove Gemfile.lock
rm Gemfile.lock

#install bundle
gem install bundle
#install the gems
bundle install
#clear the screen
clear
#run program
ruby cafe.rb CoderCafe