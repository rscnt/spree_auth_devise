module Spree
  class UserMailer < BaseMailer
    def reset_password_instructions(user, token, *args)
      @edit_password_reset_url = spree.edit_spree_user_password_url(:reset_password_token => token, :host => Spree::Store.current.url)
      content = mail().html_part.body

      resetpassword_instructions(user, token, content)
    end

    def confirmation_instructions(user, token, opts={})
      @confirmation_url = spree.spree_user_confirmation_url(:confirmation_token => token, :host => Spree::Store.current.url)
      content = mail().html_part.body
      
      confirmationinstructions(user, token, content)
    end

    def welcome_message 
      @store = Spree::Store.current.name
      mail()
    end
  end
end
