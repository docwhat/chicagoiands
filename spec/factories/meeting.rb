require 'date'

FactoryGirl.define do
  factory :meeting do
    sequence(:title) { |n| "This is the title for #{n}" }
    topic '...and this is topical'
    body <<-EOT

Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cum sociis
natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Nulla vitae elit libero, a pharetra augue. Cras justo odio, dapibus ac
facilisis in, egestas eget quam. Nullam id dolor id nibh ultricies vehicula ut
id elit. Vestibulum id ligula porta felis euismod semper.

Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Etiam porta
sem malesuada magna mollis euismod. Maecenas faucibus mollis interdum. Sed
posuere consectetur est at lobortis. Donec ullamcorper nulla non metus auctor
fringilla. Sed posuere consectetur est at lobortis. Nullam quis risus eget urna
mollis ornare vel eu leo.

Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus
porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna
mollis euismod. Vestibulum id ligula porta felis euismod semper.

Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis
in, egestas eget quam. Sed posuere consectetur est at lobortis. Vestibulum id
ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget
metus.

    EOT
    sequence(:date) { |n| Date.new(1999, 9, 9) + n }
  end
end
