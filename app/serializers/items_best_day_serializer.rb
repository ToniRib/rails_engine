class ItemsBestDaySerializer < ActiveModel::Serializer
  attributes :best_day

  def best_day
    object.best_day.created_at
  end
end
