class StatsDatatable < AjaxDatatablesRails::Base
  def as_json(options = {})
    {
      iTotalRecords: Physical::Player.count,
      iTotalDisplayRecords: stats.total_entries,
      aaData: data
    }
  end

  private

  def data
    stats.map do |stat|
      [
        stat.given_name,
        stat.surname,
        stat.avg,
        stat.home_runs,
        stat.rbi,
        stat.runs,
        stat.steals,
        stat.ops
      ]
    end
  end

  def stats
    @stats ||= fetch_stats
  end

  def fetch_stats
    Physical::Player.
      order("#{sort_column} #{sort_direction}").
      page(page).
      per_page(per_page)
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 25
  end

  def sort_column
    columns = %w[given_name surname avg home_runs rbi runs steals ops]

    columns[params[:order]['0'][:column].to_i]
  end

  def sort_direction
    params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
  end
end
