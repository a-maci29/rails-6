class TestBuilder < ActionView::Helpers::FormBuilder
    def email_field(name, options = {})
            if options[:class].present?
                options[:class] += ' form-control'
            else
                options[:class] = 'form-control'
            end

        super(name, options)
    end
end
