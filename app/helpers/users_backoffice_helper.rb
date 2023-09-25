module UsersBackofficeHelper
    def avatar_url
        avatar = current_user.user_profile.avatar
        avatar.attached? ? avatar : 'placeholder-avatar.jpg'
    end
end
