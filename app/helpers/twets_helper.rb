module TwetsHelper
  
#def retwet_link(user)
    #retwet = Retwet.where(:user => current_user, :retwetting => user)
    #if retwet.exists?
    #  button_to("Retwet", retwet_path(retwet.first),   :method => :delete,
      #                                                 :class => 'btn btn-danger mar-top-5',
     #                                                  :form => { :class => 'form-inline pull-right' })
    #else
      #form_for(:retwet, :url => retwets_path, :method => 'POST', :html => { :class => 'pull-right' }) do |f|
        #f.hidden_field(:twetting_id, :value => user.id.to_s) +
        #f.submit('Retwet', :class => "btn btn-primary mar-top-5")
        #end
      #end
    #end
  
end
