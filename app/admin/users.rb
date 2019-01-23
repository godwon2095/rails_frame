ActiveAdmin.register User do
  menu parent: "회원관리"

  scope :all

  index do
    selectable_column
    id_column
    column "프로필 사진" do |user|
      if user.image?
        image_tag user.image&.url, class: "admin-indexImage"
      else
        image_tag "default_profile.jpg", class: "admin-indexImage"
      end
    end
    # tag_column "계정 정보" do |user|
    #   if user.identity.present?
    #     provider = user.identity.provider
    #     if provider == "facebook"
    #       "페이스북"
    #     elsif provider == "google_oauth2"
    #       "구글"
    #     elsif provider == "kakao"
    #       "카카오"
    #     end
    #   else
    #     "일반계정"
    #   end
    # end
    column :name
    column :email
    # tag_column "성별" do |user|
    #   if user.gender == "not_choose"
    #     "선택안함"
    #   elsif user.gender == "man"
    #     "남자"
    #   elsif user.gender == "woman"
    #     "여자"
    #   else
    #     "없음"
    #   end
    # end
    column "전화번호" do |user|
      num_to_phone user.phone if user.phone
    end
    column :birth
    actions
  end

  filter :email
  filter :name
  filter :phone

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password if f.object.new_record?
      f.input :phone
      # f.input :content, input_html: {class: "tinymce"}
    end
    f.actions
  end

  show do
    tabs do
      tab "informations" do
        attributes_table do
          row :image do |uesr|
            if user.image.present?
              image_tag user.image&.url, :class => 'admin-showImage'
            else
              image_tag "default_profile.jpg", class: "admin-showImage"
            end
          end
          row :email
          row :name
          # tag_row "계정 정보" do |user|
          #   if user.identity.present?
          #     provider = user.identity.provider
          #     if provider == "facebook"
          #       status_tag "페이스북"
          #     elsif provider == "google_oauth2"
          #       status_tag "구글"
          #     elsif provider == "kakao"
          #       status_tag "카카오"
          #     end
          #   else
          #     status_tag "일반계정"
          #   end
          # end
          row :phone
          tag_row "성별" do |user|
            if user.gender == "not_choose"
              "선택안함"
            elsif user.gender == "man"
              "남자"
            elsif user.gender == "woman"
              "여자"
            else
              "없음"
            end
          end
          row :created_at
          row :updated_at
        end
      end
      tab "others" do
        attributes_table do
          row :sign_in_count
          row :current_sign_in_at
          row :last_sign_in_at
          row :current_sign_in_ip
          row :last_sign_in_ip
          row :encrypted_password
        end
      end
    end
  end

end
