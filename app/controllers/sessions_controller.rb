class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    session['auth'] =  auth
    token = auth['credentials']['token']
    endpoint = "https://graph.facebook.com/v2.5/me/accounts?access_token=#{token}"
    pages = JSON.parse(RestClient.get(endpoint))['data']
    if pages.select{|page| page['id'] == '202504093429829'}.any? 
      photos_data = []
      endpoint = "https://graph.facebook.com/v2.5/202504093429829/albums?access_token=#{token}"
      JSON.parse(RestClient.get(endpoint))['data'].each do |album_data|
        unless album_data.fetch('name').match(/Cover Photos|Profile Pictures/i)
          endpoint = "https://graph.facebook.com/v2.5/#{album_data.fetch 'id'}/photos?fields=picture,created_time,images,name,link&access_token=#{token}"
          photos_data.push(*JSON.parse(RestClient.get(endpoint))['data'])
        end
      end
      photo_f_ids = []
      photos_data.first(10).each do |photo_data|
        photo = Photo.find_or_initialize_by(f_id: photo_data.fetch('id'))
        photo_f_ids.push photo.f_id
        photo.update_attributes!(\
          thumbnail: photo_data.fetch('picture'),
          time: photo_data.fetch('created_time'),
          url: photo_data.fetch('images').select{|image| image.fetch('height') > 400 && image.fetch('width') > 400}.last.try(:[], 'source'),
          link: photo_data.fetch('link'),
          title: photo_data['name'],
        )
        photo.save!
      end
      Photo.where.not(f_id: photo_f_ids).each &:destroy!
      session['is_admin'] =  true
    end
    redirect_to root_path
  end
  def destroy
    reset_session
    redirect_to root_path
  end
  def book
    
  end
  def book_post
  end
end
