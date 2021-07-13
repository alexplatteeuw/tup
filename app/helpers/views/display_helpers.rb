# frozen_string_literal: true

helpers do
  def insert_label_for_starting_point(type)
    labels = { publication: 'Depuis une date de publication', legal_effect: 'Pour une date de réalisation' }
    labels[type.to_sym]
  end

  def insert_flatpickr_input_value(publication, legal_effect, starting_point)
    return Date.today if publication.blank? && legal_effect.blank?

    input_values = { publication: publication, legal_effect: legal_effect }
    input_values[starting_point.to_sym]
  end

  def insert_checked_attribute(type, starting_point)
    starting_point == type && 'checked'
  end

  def insert_kind_of_day_off(date)
    if date.saturday?
      'samedi'
    elsif date.sunday?
      'dimanche'
    elsif date.holiday?(:fr)
      'jour férié'
    else
      french_day_names[date.cwday - 1]
    end
  end

  def french_day_names
    french_day_names ||= %w[lundi mardi mercredi jeudi vendredi samedi dimanche].freeze
  end
end
