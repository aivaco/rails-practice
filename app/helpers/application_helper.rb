module ApplicationHelper
    #Takes an alert type and returns its respective bootstrap class.
    def flash_class(level)
        if level == 'notice'
            level = 'alert alert-info alert-dismissable fade show'
        elsif level == 'success'
            level = 'alert alert-success alert-dismissable fade show'
        elsif level == 'error'
            level = 'alert alert-danger alert-dismissable fade show'
        elsif level == 'alert'
            level = 'alert alert-warning alert-dismissable fade show'
        end
    end
    
end
