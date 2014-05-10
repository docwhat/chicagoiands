FactoryGirl.define do
  factory :texture do
    sequence(:label) { |n| "label#{n}" }

    body <<-EOT
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam eget
risus varius blandit sit amet non magna. Maecenas faucibus mollis interdum.
Donec id elit non mi porta gravida at eget metus. Aenean eu leo quam.
Pellentesque ornare sem lacinia quam venenatis vestibulum. Integer posuere erat
a ante venenatis dapibus posuere velit aliquet.

Donec sed odio dui. Praesent commodo cursus magna, vel scelerisque nisl
consectetur et. Nullam id dolor id nibh ultricies vehicula ut id elit. Donec
ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Donec id elit non mi porta
gravida at eget metus. Praesent commodo cursus magna, vel scelerisque nisl
consectetur et. Praesent commodo cursus magna, vel scelerisque nisl consectetur
et. Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis
dapibus posuere velit aliquet. Sed posuere consectetur est at lobortis.

Curabitur blandit tempus porttitor. Maecenas sed diam eget risus varius blandit
sit amet non magna. Sed posuere consectetur est at lobortis. Donec id elit non
mi porta gravida at eget metus. Donec ullamcorper nulla non metus auctor
fringilla. Nulla vitae elit libero, a pharetra augue.

    EOT
  end
end
