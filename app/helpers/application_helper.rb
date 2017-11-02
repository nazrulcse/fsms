module ApplicationHelper
  def generate_checklist_field(checklist)
    if checklist.item_type.downcase == 'info'
      text_field_tag 'info[]', '', placeholder: checklist.options, class: 'form-control'
    elsif checklist.item_type.downcase == 'select'
      select_tag 'choice[]', options_for_select(checklist.options.split(',')), {class: 'form-control'}
    elsif checklist.item_type.downcase == 'check'
      html = "<div class='options-multiple-choice'>"
      checklist.options.split(',').each do |op|
        html += radio_button_tag 'check[]', op, id: "check_#{op.split.join}"
        html += "<label for='check_#{op.split.join}'>#{op}</label>"
      end
      raw(html + "</div>")
    elsif checklist.item_type.downcase == 'multiple choice'
      html = "<div class='options-multiple-choice'>"
      checklist.options.split(',').each do |op|
        html += check_box_tag 'check[]', op, false, id: "check_#{op.split.join}"
        html += "<label for='check_#{op.split.join}'>#{op}</label>"
      end
      raw(html + "</div>")
    else
      checklist.options
    end
  end

  def active_menu(ct_name)
    controller_name == ct_name ? 'active' : ''
  end

  def get_technician
    role = Role.where(name: 'Technician').first
    role.users
  end
end
