module FormHelperHelper

  def form_field(builder, input_type, name)
    content_tag(:div,
                content_tag(:label, name.to_s.humanize) +
                    builder.send(input_type.to_sym, name, {:class => 'text-input small-input'}),
                :style => 'padding: 5px 0 10px 0; line-height: 1.6em;'
    )
  end
end
