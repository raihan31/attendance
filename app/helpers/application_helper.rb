module ApplicationHelper

  def in_out_select(attendances)
    if attendances.present?
        if attendances.last.out_time.present?
          link_to 'In', attends_path, method: :post, class:'btn btn-success'
        else
          link_to 'Out', attend_path(id: attendances.last.id), method: :put, class:'btn btn-danger'
        end
    else
      link_to 'In', attends_path, method: :post, class:'btn btn-success'
    end
  end
end
