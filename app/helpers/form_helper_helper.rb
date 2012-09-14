module FormHelperHelper

  def form_field(builder, input_type, name, options = {:input_class => 'small-input'})
    content_tag(:div,
                content_tag(:label, name.to_s.humanize) +
                    builder.send(input_type.to_sym, name, {:class => "text-input #{options[:input_class]}",
                                                           :style => options[:style],}.merge(options[:input_options] || {})),
                :style => "padding: 5px 0 10px 0; line-height: 1.6em; "
    )
  end

  def form_field_tag(input_type, name, options = {:input_class => 'small-input'})
    content_tag(:div,
                content_tag(:label, name.to_s.humanize) +
                    send(input_type.to_sym, name, params[input_type.to_sym] ,:class => "text-input #{options[:input_class]}",
                                                           :style => options[:style]),
                :style => "padding: 5px 0 10px 0; line-height: 1.6em; "
    )
  end
end
