# coding: utf-8

module ModelMacros
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def it_should_behave_like_a_rendered_model(model_name) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      it "updates 'rendered' when saving 'body'" do
        model = FactoryGirl.create(model_name.to_sym)
        model.body = 'one _two_ three'
        model.rendered = 'not correct'
        model.save!
        expect(model.rendered).to eq("<p>one <em>two</em> three</p>\n")
      end

      it "has an html_safe 'rendered'" do
        model = FactoryGirl.create(model_name.to_sym)
        expect(model.rendered).to be_html_safe
      end
    end
  end
end
