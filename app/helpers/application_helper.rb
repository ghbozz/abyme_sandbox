module ApplicationHelper

  def abymize(form, association, &block)
    content_tag(:div, data: { target: 'abyme.associations' }) do
      content_tag(:template, class: "abyme--#{formatize(association).singularize}_template", data: { target: 'abyme.template' }) do
        form.fields_for formatize(association), association, child_index: 'NEW_RECORD' do |f|
          content_tag(:div, class: 'abyme--fields') do
            render("#{formatize(association).singularize}_fields", f: f)
          end
        end
      end
    end
  end

  def abyme_records(form, associations)
    form.fields_for associations, form.object.send(associations).order(created_at: :desc) do |f|
      content_tag(:div, class: 'abyme--fields') do
        render("#{associations.to_s.singularize}_fields", f: f)
      end
    end
  end

  def abyme_container_for(association, &block)
    content_tag(:div, data: { controller: 'abyme' }) do
      capture(&block)
    end
  end

  def abyme_add_association(text, **options)
    button_tag(text, { data: { action: 'click->abyme#add_association' } }.merge(options))
  end

  def abyme_remove_association(text, **options)
    button_tag(text, { data: { action: 'click->abyme#remove_association' } }.merge(options))
  end

  def formatize(association)
    association.class.name.tableize
  end

end
