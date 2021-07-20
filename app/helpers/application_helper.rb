module ApplicationHelper
  def alert_class_for(type)
    {
      alert: 'bg-red-400'
    }.stringify_keys[type.to_s] || type.to_s
  end
end
