FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "Something that happened part #{n}" }
    author 'John Doe'
    body <<-EOT

Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras justo
odio, dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet,
consectetur adipiscing elit. Duis mollis, est non commodo luctus, nisi erat
porttitor ligula, eget lacinia odio sem nec elit.

Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac
cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit
amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras
justo odio, dapibus ac facilisis in, egestas eget quam. Aenean lacinia bibendum
nulla sed consectetur.

Donec sed odio dui. Cras mattis consectetur purus sit amet fermentum. Vivamus
sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia
bibendum nulla sed consectetur. Cum sociis natoque penatibus et magnis dis
parturient montes, nascetur ridiculus mus.

Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus,
nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque
penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum
dolor sit amet, consectetur adipiscing elit. Maecenas faucibus mollis
interdum. Curabitur blandit tempus porttitor.

    EOT
  end
end
