module ApplicationHelper

    ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

    def application_flash_messages_helper(options = {})
      flash_messages = []
      flash.each do |type, message|
        # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
        next if message.blank?
  
        type = type.to_sym
        type = :success if type == :notice || type == :success
        type = :danger  if type == :alert || type == :danger
        type = :danger  if type == :error
        type = :warning if type == :warning
        type = :info    if type == :info
        next unless ALERT_TYPES.include?(type)
  
        tag_class = options.extract!(:class)[:class]
        tag_options = {
          class: "alert fade in alert-#{type} #{tag_class}"
        }.merge(options)
  
        close_button = content_tag(:button, raw("&times;"), type: "button", class: "close", "data-dismiss" => "alert")
  
        Array(message).each do |msg|
          text = content_tag(:div, close_button + msg, tag_options)
          flash_messages << text if msg
        end
      end
      flash_messages.join("\n").html_safe
    end

    def application_error_messages_helper(resource)
        return '' if resource.errors.empty?

        messages = resource.errors.full_messages.map { |message| content_tag(:li, message) }.join
        sentence = I18n.t(
            'errors.messages.not_saved',
            count: resource.errors.count,
            resource: resource.class.model_name.human.downcase
        )

        html = <<-HTML
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="alert-heading">#{sentence}</h4>
            <ul class="mb-0">#{messages}</ul>
        </div>
        HTML

        html.html_safe
    end

    def datetime_format(datetime)
        datetime.strftime("%B %d, %Y | %l:%M %p")
    end

end
