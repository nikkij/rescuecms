class AnimalsDatatable
  delegate :params, :h, :link_to, :image_tag, :number_to_currency, :time_ago_in_words, :move_admin_animal_path, :edit_admin_animal_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: animals.count,
      iTotalDisplayRecords: animals.total_entries,
      aaData: data
    }
  end

  private

  def data
    # animals.map do |animal|
    #   [
    #   	link_to(animal.name, animal),
    #   	h(animal.code),
    #   	h(animal.status),
    #   	h(animal.location),
    #   	h(animal.created_at)
    # 
    #  ]
    # end
    animals.map do |animal|
      [
      	image_tag(animal.picture_url(:thumbnail), :alt => animal.name)+link_to(animal.name,animal),
        animal.code,
        animal.status,
        animal.location.name,
        time_ago_in_words(animal.created_at),
        link_to('Edit', edit_admin_animal_path(animal), method: :get, :class => 'btn btn-mini'),
        link_to('Move', move_admin_animal_path(animal), method: :get, :class => 'btn btn-mini')
      ]
    end
  end

  def animals
    @animals ||= fetch_animals
  end

  def fetch_animals
    animals = Animal.order("#{sort_column} #{sort_direction}")
    animals = animals.page(page).per_page(per_page)
    if params[:sSearch].present?
      animals = animals.where('name ILIKE ?', "%#{params[:sSearch]}%")
    end
    animals
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end