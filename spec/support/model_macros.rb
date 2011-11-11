module ModelMacros
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def it_should_behave_like_a_rendered_model model_name

      it "updates 'rendered' when saving 'body'" do
        model = Factory.create(model_name.to_sym)
        model.body = "one _two_ three"
        model.rendered = "random"
        model.save!
        model.rendered.should == "<p>one <em>two</em> three</p>\n"
      end

      it "has an html_safe 'rendered'" do
        model = Factory.create(model_name.to_sym)
        model.rendered.should be_html_safe
      end

    end
  end
end