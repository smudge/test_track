json.(visitor, :id)
json.assignments visitor.assignments.includes(:split).order(:created_at), :split_name, :variant_or_decision, :context, :unsynced
