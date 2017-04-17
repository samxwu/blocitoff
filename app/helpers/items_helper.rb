require 'action_view'

module ItemsHelper

    include ActionView::Helpers::DateHelper
    
    def time_remaining(created_at)
        time_remaining = if (Time.now - created_at).round < 604800 # number of seconds in 7 days
                            distance_of_time_in_words(Time.now, created_at + 604800)
                         else
                            "expired"
                        end
    end

end
