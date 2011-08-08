require 'date'

Factory.define :meeting do |f|
  f.title "This is the title"
  f.topic "...and this is topical"
  f.body "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla vitae elit libero, a pharetra augue. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam id dolor id nibh ultricies vehicula ut id elit. Vestibulum id ligula porta felis euismod semper.

Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Etiam porta sem malesuada magna mollis euismod. Maecenas faucibus mollis interdum. Sed posuere consectetur est at lobortis. Donec ullamcorper nulla non metus auctor fringilla. Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo.

Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Vestibulum id ligula porta felis euismod semper.

Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Sed posuere consectetur est at lobortis. Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus."
  f.sequence(:date) { |n| Date.new(1999,9,9) + n }
end

Factory.define :story do |f|
  f.sequence(:title) { |n| "Something that happened part #{n}" }
  f.author "John Doe"
  f.body "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.

Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Aenean lacinia bibendum nulla sed consectetur.

Donec sed odio dui. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus mollis interdum. Curabitur blandit tempus porttitor."
end

Factory.define :user do |f|
  f.sequence(:logon) { |n| "johndoe#{n}" }
  f.password "foobar"
  f.password_confirmation {|u| u.password}
end
