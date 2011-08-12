module ModelMacros
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def it_should_update_rendered_on_save model_name
      it "updates 'rendered' when saving 'body'" do
        model = Factory.create(model_name.to_sym)
        model.body = "one _two_ three"
        model.rendered = "random"
        model.save!
        model.rendered.should == "<p>one <em>two</em> three</p>\n"
      end
    end
  end
end
